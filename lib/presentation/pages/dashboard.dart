import 'package:flutter/material.dart';
import 'package:open_weather/data/locations.dart';
import 'package:open_weather/presentation/layouts/dashboard/d_dashboard.dart';
import 'package:open_weather/presentation/layouts/dashboard/m_dashboard.dart';
import 'package:open_weather/presentation/layouts/dashboard/t_dashboard.dart';
import 'package:open_weather/presentation/responsive_container.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final pageController = PageController(viewportFraction: 0.33);
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ResponsiveContainer.isMobile(context)
          ? FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.search),
            )
          : null,
      bottomNavigationBar: ResponsiveContainer.isMobile(context)
          ? buildBottomSwipeNavigation()
          : null,
      body: const SafeArea(
        child: ResponsiveContainer(
          mobile: MDashboard(),
          tablet: TDashboard(),
          desktop: DDashboard(),
        ),
      ),
    );
  }

  BottomAppBar buildBottomSwipeNavigation() {
    TextTheme textTheme = Theme.of(context).textTheme;
    bool loading = false;
    return BottomAppBar(
      child: PageView.builder(
        itemCount: locations.length,
        controller: pageController,
        onPageChanged: (index) => setState(() => pageIndex = index),
        itemBuilder: (_, index) {
          return AnimatedScale(
            scale: index == pageIndex ? 1.4 : 0.9,
            duration: const Duration(milliseconds: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.linear);
                  },
                  child: Text(
                    locations[index],
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodyLarge!.copyWith(
                        color: index == pageIndex
                            ? Theme.of(context).textTheme.bodyLarge!.color
                            : Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .color!
                                .withOpacity(0.3)),
                  ),
                ),
                if (index == pageIndex)
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                    child: LinearProgressIndicator(
                        value: loading == true ? null : 1),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

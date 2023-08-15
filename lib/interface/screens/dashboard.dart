import 'package:flutter/material.dart';
import 'package:open_weather/interface/animations/number_switcher.dart';
import 'package:open_weather/interface/animations/shake.dart';
import 'package:open_weather/interface/theme/theme_colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final pageController = PageController(viewportFraction: 0.33);
  int pageIndex = 0;
  List<String> locations = ["Mumbai", "Banglore", "Hydrabad", "Delhi", "Pune"];
  List<double> temperatures = [32, 41, 25, 33, 21];

  final scrollController = ScrollController();
  ValueNotifier<bool> showTopLayout = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels < 120) {
        showTopLayout.value = false;
      } else {
        showTopLayout.value = true;
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.search),
      ),
      bottomNavigationBar: buildBottomSwipeNavigation(),
      body: SafeArea(
        child: Stack(
          children: [
            buildMainLayout(),
            buildhidingAppBar(),
          ],
        ),
      ),
    );
  }

  Widget buildhidingAppBar() {
    TextTheme textTheme = Theme.of(context).textTheme;
    return ValueListenableBuilder<bool>(
      valueListenable: showTopLayout,
      builder: (context, val, _) {
        return Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AnimatedOpacity(
            opacity: val ? 1 : 0,
            duration: const Duration(milliseconds: 100),
            child: Container(
              height: 56,
              color: Theme.of(context).scaffoldBackgroundColor,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  const Image(image: AssetImage("assets/images/01d.png")),
                  const SizedBox(width: 16),
                  Text("25°C", style: textTheme.titleLarge),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  ListView buildMainLayout() {
    return ListView(
      padding: const EdgeInsets.all(16),
      physics: const BouncingScrollPhysics(),
      controller: scrollController,
      children: [
        buildMainContainer(),
        buildCelciusFarenheitCard(degree: "31"),
      ],
    );
  }

  Container buildMainContainer() {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                const Expanded(
                  flex: 2,
                  child: Shake(
                      child: Image(image: AssetImage("assets/images/09d.png"))),
                ),
                const SizedBox(height: 8),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      "Moderate Rain",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      "Night",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: NumberSwitcher(
                              start: 32,
                              end: 41,
                              appendText: "°",
                              duration: const Duration(milliseconds: 500),
                              textStyle:
                                  Theme.of(context).textTheme.titleLarge!),
                        ),
                      ),
                      Text("Feels like 34°C",
                          style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Card buildCelciusFarenheitCard({required String degree}) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("$degree° Celcius", style: textTheme.bodyLarge),
              const VerticalDivider(
                  width: 4, color: ThemeColors.highlight, thickness: 1),
              Text("$degree° Fahrenheit", style: textTheme.bodyLarge),
            ],
          ),
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

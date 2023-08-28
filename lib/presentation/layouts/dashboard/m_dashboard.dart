import 'package:flutter/material.dart';
import 'package:open_weather/core/utils/gutter_space.dart';
import 'package:open_weather/presentation/components/dashboard_components.dart';

class MDashboard extends StatefulWidget {
  const MDashboard({super.key});

  @override
  State<MDashboard> createState() => _MDashboardState();
}

class _MDashboardState extends State<MDashboard> {
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
    return Stack(
      children: [
        buildMainLayout(context: context),
        buildhidingAppBar(),
      ],
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
                  gutterSpace(horizontal: 16),
                  Text("25°C", style: textTheme.titleLarge),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

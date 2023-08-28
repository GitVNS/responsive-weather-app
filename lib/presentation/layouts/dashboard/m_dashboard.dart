import 'package:flutter/material.dart';
import 'package:open_weather/core/theme/theme_colors.dart';
import 'package:open_weather/core/utils/extensions.dart';
import 'package:open_weather/core/utils/gutter_space.dart';
import 'package:open_weather/presentation/animations/live_widget.dart';
import 'package:open_weather/presentation/animations/number_switcher.dart';

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
        buildMainLayout(),
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

  ListView buildMainLayout() {
    return ListView(
      padding: const EdgeInsets.all(16),
      physics: const BouncingScrollPhysics(),
      primary: false,
      controller: scrollController,
      children: [
        buildMainContainer(),
        gutterSpace(vertical: 16),
        buildCelciusFarenheitCard(degree: "31"),
      ],
    );
  }

  Widget buildMainContainer() {
    return SizedBox(
      height: 240,
      child: Row(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 80,
                width: double.infinity,
                child: LiveWidget(
                  child: Image(
                    image: AssetImage("assets/images/04d.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                "Moderate\nRain",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ).centerThis().expanded(),
            ],
          ).expanded(),
          Column(
            children: [
              SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Day",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: ThemeColors.highlight)),
                    gutterSpace(horizontal: 8),
                    const Icon(Icons.wb_sunny_rounded,
                        color: ThemeColors.highlight),
                  ],
                ),
              ),
              gutterSpace(vertical: 8),
              const NumberSwitcher(
                start: 32,
                end: 41,
                appendText: "°",
                duration: Duration(milliseconds: 500),
              ).fittedBox(fit: BoxFit.contain).expanded(),
            ],
          ).expanded(flex: 2),
        ],
      ),
    );
  }

  Card buildCelciusFarenheitCard({required String degree}) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("$degree° Celcius",
                overflow: TextOverflow.ellipsis, style: textTheme.bodyLarge),
            const VerticalDivider(
                width: 4, color: ThemeColors.highlight, thickness: 1),
            Text("$degree° Fahrenheit",
                overflow: TextOverflow.ellipsis, style: textTheme.bodyLarge),
          ],
        ),
      ).symetricPadding(vertical: 16),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:open_weather/core/theme/theme_colors.dart';
import 'package:open_weather/core/utils/extensions.dart';
import 'package:open_weather/core/utils/gutter_space.dart';
import 'package:open_weather/data/locations.dart';
import 'package:open_weather/presentation/animations/live_widget.dart';
import 'package:open_weather/presentation/animations/number_switcher.dart';

class TDashboard extends StatefulWidget {
  const TDashboard({super.key});

  @override
  State<TDashboard> createState() => _TDashboardState();
}

class _TDashboardState extends State<TDashboard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 200,
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(color: ThemeColors.onBackground, width: 0.5),
            ),
          ),
          child: ListView.separated(
            itemCount: locations.length,
            physics: const BouncingScrollPhysics(),
            primary: false,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: index == 0
                      ? ThemeColors.highlight
                      : ThemeColors.onBackground.withOpacity(0.2),
                  border: index == 0
                      ? null
                      : Border.all(color: ThemeColors.onBackground, width: 1),
                ),
                alignment: Alignment.center,
                child: Text(
                  locations[index],
                ),
              );
            },
            separatorBuilder: (context, index) => gutterSpace(vertical: 16),
          ),
        ),
        Container(
          child: buildMainLayout(),
        ).expanded(),
      ],
    );
  }

  ListView buildMainLayout() {
    return ListView(
      padding: const EdgeInsets.all(16),
      physics: const BouncingScrollPhysics(),
      primary: false,
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

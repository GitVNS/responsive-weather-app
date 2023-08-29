import 'package:flutter/material.dart';
import 'package:open_weather/core/theme/theme_colors.dart';
import 'package:open_weather/core/utils/extensions.dart';
import 'package:open_weather/core/utils/gutter_space.dart';
import 'package:open_weather/data/locations.dart';
import 'package:open_weather/presentation/animations/live_widget.dart';
import 'package:open_weather/presentation/animations/number_switcher.dart';
import 'package:open_weather/presentation/components/shared/card_with_title.dart';

class DDashboard extends StatelessWidget {
  const DDashboard({super.key});

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
                child: Text(locations[index],
                    style: Theme.of(context).textTheme.bodyLarge),
              );
            },
            separatorBuilder: (context, index) => gutterSpace(vertical: 16),
          ),
        ),
        Container(
          color: ThemeColors.onBackground.withOpacity(0.2),
          child: Row(
            children: [
              gutterSpace(horizontal: 32),
              IntrinsicWidth(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60,
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
                    SizedBox(
                      width: 240,
                      height: 180,
                      child: const NumberSwitcher(
                        start: 0,
                        end: 41,
                        appendText: "°",
                        duration: Duration(milliseconds: 500),
                      ).fittedBox(fit: BoxFit.cover),
                    ),
                    const Divider(
                        color: ThemeColors.highlight, height: 2, thickness: 2),
                    gutterSpace(vertical: 32),
                    Row(
                      children: [
                        const SizedBox(
                          height: 80,
                          width: 100,
                          child: LiveWidget(
                            child: Image(
                                image: AssetImage("assets/images/09d.png"),
                                fit: BoxFit.contain),
                          ),
                        ),
                        gutterSpace(horizontal: 16),
                        Text(
                          "Moderate\nRain",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    gutterSpace(vertical: 32),
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: ThemeColors.background.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Text("Feels like 33° Celcius",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyLarge),
                    ),
                    gutterSpace(vertical: 32),
                  ],
                ).symetricPadding(horizontal: 16, vertical: 16),
              ),
              gutterSpace(horizontal: 32),
              Container(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: ThemeColors.onBackground.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: cardWithTitleInnerContainer(
                        context: context,
                        items: [
                          CardWithTitleItem(
                              label: "Normal",
                              icon: "assets/icons/temperature.svg",
                              info: "298.48"),
                          CardWithTitleItem(
                              label: "Minimum",
                              icon: "assets/icons/temp_minimum.svg",
                              info: "298.48"),
                          CardWithTitleItem(
                              label: "Maximum",
                              icon: "assets/icons/temp_maximum.svg",
                              info: "298.48"),
                        ],
                      ).symetricPadding(horizontal: 8, vertical: 8),
                    ).symetricPadding(horizontal: 8, vertical: 8).expanded(),
                    Container(
                      decoration: BoxDecoration(
                        color: ThemeColors.onBackground.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: cardWithTitleInnerContainer(
                        context: context,
                        items: [
                          CardWithTitleItem(
                              label: "Celcius",
                              icon: "assets/icons/celcius.svg",
                              info: "31"),
                          CardWithTitleItem(
                              label: "Fahrenheit",
                              icon: "assets/icons/fahrenheit.svg",
                              info: "38"),
                          CardWithTitleItem(
                              label: "Kelvin",
                              icon: "assets/icons/kelvin.svg",
                              info: "27"),
                        ],
                      ).symetricPadding(horizontal: 8, vertical: 8),
                    ).symetricPadding(horizontal: 8, vertical: 8).expanded(),
                    Container(
                      decoration: BoxDecoration(
                        color: ThemeColors.onBackground.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: cardWithTitleInnerContainer(
                        context: context,
                        items: [
                          CardWithTitleItem(
                              label: "Speed",
                              icon: "assets/icons/speed.svg",
                              info: "0.62 Km/hr"),
                          CardWithTitleItem(
                              label: "Gust",
                              icon: "assets/icons/gust.svg",
                              info: "1.18"),
                          CardWithTitleItem(
                              label: "Degree",
                              icon: "assets/icons/degree.svg",
                              info: "349"),
                        ],
                      ).symetricPadding(horizontal: 8, vertical: 8),
                    ).symetricPadding(horizontal: 8, vertical: 8).expanded(),
                    Container(
                      decoration: BoxDecoration(
                        color: ThemeColors.onBackground.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: cardWithTitleInnerContainer(
                        context: context,
                        items: [
                          CardWithTitleItem(
                              label: "Humidity",
                              icon: "assets/icons/humidity.svg",
                              info: "64"),
                          CardWithTitleItem(
                              label: "Sea Level",
                              icon: "assets/icons/sea.svg",
                              info: "1015"),
                          CardWithTitleItem(
                              label: "Ground Level",
                              icon: "assets/icons/ground.svg",
                              info: "933"),
                        ],
                      ).symetricPadding(horizontal: 8, vertical: 8),
                    ).symetricPadding(horizontal: 8, vertical: 8).expanded(),
                  ],
                ).symetricPadding(horizontal: 16, vertical: 16),
              ).expanded()
            ],
          ),
        ).expanded(),
      ],
    );
  }
}

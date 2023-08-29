import 'package:flutter/material.dart';
import 'package:open_weather/core/theme/theme_colors.dart';
import 'package:open_weather/core/utils/extensions.dart';
import 'package:open_weather/core/utils/gutter_space.dart';
import 'package:open_weather/presentation/animations/live_widget.dart';
import 'package:open_weather/presentation/animations/number_switcher.dart';
import 'package:open_weather/presentation/components/shared/card_with_title.dart';
import 'package:open_weather/presentation/components/wave_clipper.dart';

ListView buildMainLayout({required BuildContext context}) {
  return ListView(
    padding: const EdgeInsets.all(0),
    physics: const BouncingScrollPhysics(),
    primary: false,
    children: [
      ClipPath(
          clipper: WaveClipper(), child: buildMainContainer(context: context)),
      gutterSpace(vertical: 16),
      buildFeelsLikeCard(degree: "31", context: context),
      temperatureCard(context: context),
      tempConversionCard(context: context),
      windCard(context: context),
      humidityCard(context: context),
      gutterSpace(vertical: 16),
    ],
  );
}

Container buildMainContainer({required BuildContext context}) {
  return Container(
    height: 320,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
    color: ThemeColors.onBackground.withOpacity(0.2),
    child: Row(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 80,
              width: double.infinity,
              child: LiveWidget(
                child: Image(
                  image: AssetImage("assets/images/09d.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Moderate\nRain",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Container(
                  height: 2,
                  width: 30,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  color: ThemeColors.highlight,
                ),
              ],
            ).expanded(),
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
              start: 0,
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

Card buildFeelsLikeCard(
    {required String degree, required BuildContext context}) {
  TextTheme textTheme = Theme.of(context).textTheme;
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    margin: const EdgeInsets.symmetric(horizontal: 16),
    child: Text("Feels like $degree° Celcius",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyLarge)
        .symetricPadding(horizontal: 16, vertical: 16),
  );
}

Widget temperatureCard({required BuildContext context}) {
  return cardWithTitle(
      title: "Temperature",
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
      context: context);
}

Widget tempConversionCard({required BuildContext context}) {
  return cardWithTitle(
      alignRight: true,
      title: "Conversion",
      items: [
        CardWithTitleItem(
            label: "Celcius", icon: "assets/icons/celcius.svg", info: "31"),
        CardWithTitleItem(
            label: "Fahrenheit",
            icon: "assets/icons/fahrenheit.svg",
            info: "38"),
        CardWithTitleItem(
            label: "Kelvin", icon: "assets/icons/kelvin.svg", info: "27"),
      ],
      context: context);
}

Widget windCard({required BuildContext context}) {
  return cardWithTitle(
      title: "Wind",
      items: [
        CardWithTitleItem(
            label: "Speed", icon: "assets/icons/speed.svg", info: "0.62 Km/hr"),
        CardWithTitleItem(
            label: "Gust", icon: "assets/icons/gust.svg", info: "1.18"),
        CardWithTitleItem(
            label: "Degree", icon: "assets/icons/degree.svg", info: "349"),
      ],
      context: context);
}

Widget humidityCard({required BuildContext context}) {
  return cardWithTitle(
      title: "More",
      alignRight: true,
      items: [
        CardWithTitleItem(
            label: "Humidity", icon: "assets/icons/humidity.svg", info: "64"),
        CardWithTitleItem(
            label: "Sea Level", icon: "assets/icons/sea.svg", info: "1015"),
        CardWithTitleItem(
            label: "Ground Level",
            icon: "assets/icons/ground.svg",
            info: "933"),
      ],
      context: context);
}

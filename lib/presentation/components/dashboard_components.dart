import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      buildCelciusFarenheitCard(degree: "31", context: context),
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

Card buildCelciusFarenheitCard(
    {required String degree, required BuildContext context}) {
  TextTheme textTheme = Theme.of(context).textTheme;
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    margin: const EdgeInsets.symmetric(horizontal: 16),
    child: IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("$degree° Celcius",
              overflow: TextOverflow.ellipsis, style: textTheme.bodyLarge),
          const VerticalDivider(color: ThemeColors.highlight, thickness: 1),
          Text("$degree° Fahrenheit",
              overflow: TextOverflow.ellipsis, style: textTheme.bodyLarge),
        ],
      ),
    ).symetricPadding(vertical: 16),
  );
}

Widget temperatureCard({required BuildContext context}) {
  return cardWithTitle(
      title: "Temperature",
      child: IntrinsicHeight(
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/temperature.svg",
                  height: 40,
                  width: 40,
                  colorFilter: const ColorFilter.mode(
                      ThemeColors.onBackground, BlendMode.srcATop),
                ),
                gutterSpace(vertical: 4),
                Text("Normal",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium),
                Text("298.48",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: ThemeColors.highlight)),
              ],
            ).expanded(),
            const VerticalDivider(
                color: ThemeColors.onBackground,
                thickness: 1,
                width: 2,
                indent: 40,
                endIndent: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/temp_minimum.svg",
                  height: 40,
                  width: 40,
                  colorFilter: const ColorFilter.mode(
                      ThemeColors.onBackground, BlendMode.srcATop),
                ),
                gutterSpace(vertical: 4),
                Text("Minimum",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium),
                Text("298.48",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: ThemeColors.highlight)),
              ],
            ).expanded(),
            const VerticalDivider(
                color: ThemeColors.onBackground,
                thickness: 1,
                width: 2,
                indent: 40,
                endIndent: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/temp_maximum.svg",
                  height: 40,
                  width: 40,
                  colorFilter: const ColorFilter.mode(
                      ThemeColors.onBackground, BlendMode.srcATop),
                ),
                gutterSpace(vertical: 4),
                Text("Maximum",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium),
                Text("298.48",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: ThemeColors.highlight)),
              ],
            ).expanded(),
          ],
        ),
      ),
      context: context);
}

Widget tempConversionCard({required BuildContext context}) {
  return cardWithTitle(
      alignRight: true,
      title: "Conversion",
      child: IntrinsicHeight(
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/celcius.svg",
                  height: 40,
                  width: 40,
                  colorFilter: const ColorFilter.mode(
                      ThemeColors.onBackground, BlendMode.srcATop),
                ),
                gutterSpace(vertical: 4),
                Text("Celcius",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium),
                Text("298.48",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: ThemeColors.highlight)),
              ],
            ).expanded(),
            const VerticalDivider(
                color: ThemeColors.onBackground,
                thickness: 1,
                width: 2,
                indent: 40,
                endIndent: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/fahrenheit.svg",
                  height: 40,
                  width: 40,
                  colorFilter: const ColorFilter.mode(
                      ThemeColors.onBackground, BlendMode.srcATop),
                ),
                gutterSpace(vertical: 4),
                Text("Fahrenheit",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium),
                Text("298.48",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: ThemeColors.highlight)),
              ],
            ).expanded(),
            const VerticalDivider(
                color: ThemeColors.onBackground,
                thickness: 1,
                width: 2,
                indent: 40,
                endIndent: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/kelvin.svg",
                  height: 40,
                  width: 40,
                  colorFilter: const ColorFilter.mode(
                      ThemeColors.onBackground, BlendMode.srcATop),
                ),
                gutterSpace(vertical: 4),
                Text("Kelvin",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium),
                Text("298.48",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: ThemeColors.highlight)),
              ],
            ).expanded(),
          ],
        ),
      ),
      context: context);
}

Widget windCard({required BuildContext context}) {
  return cardWithTitle(
      title: "Wind",
      child: IntrinsicHeight(
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/speed.svg",
                  height: 40,
                  width: 40,
                  colorFilter: const ColorFilter.mode(
                      ThemeColors.onBackground, BlendMode.srcATop),
                ),
                gutterSpace(vertical: 4),
                Text("Speed",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium),
                Text("0.62",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: ThemeColors.highlight)),
              ],
            ).expanded(),
            const VerticalDivider(
                color: ThemeColors.onBackground,
                thickness: 1,
                width: 2,
                indent: 40,
                endIndent: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/gust.svg",
                  height: 40,
                  width: 40,
                  colorFilter: const ColorFilter.mode(
                      ThemeColors.onBackground, BlendMode.srcATop),
                ),
                gutterSpace(vertical: 4),
                Text("Gust",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium),
                Text("1.18",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: ThemeColors.highlight)),
              ],
            ).expanded(),
            const VerticalDivider(
                color: ThemeColors.onBackground,
                thickness: 1,
                width: 2,
                indent: 40,
                endIndent: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/degree.svg",
                  height: 40,
                  width: 40,
                  colorFilter: const ColorFilter.mode(
                      ThemeColors.onBackground, BlendMode.srcATop),
                ),
                gutterSpace(vertical: 4),
                Text("Degree",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium),
                Text("349",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: ThemeColors.highlight)),
              ],
            ).expanded(),
          ],
        ),
      ),
      context: context);
}

Widget humidityCard({required BuildContext context}) {
  return cardWithTitle(
      title: "More",
      alignRight: true,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/humidity.svg",
                  height: 40,
                  width: 40,
                  colorFilter: const ColorFilter.mode(
                      ThemeColors.onBackground, BlendMode.srcATop),
                ),
                gutterSpace(vertical: 4),
                Text("Humidity",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium),
                Text("64",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: ThemeColors.highlight)),
              ],
            ).expanded(),
            const VerticalDivider(
                color: ThemeColors.onBackground,
                thickness: 1,
                width: 2,
                indent: 40,
                endIndent: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/sea.svg",
                  height: 40,
                  width: 40,
                  colorFilter: const ColorFilter.mode(
                      ThemeColors.onBackground, BlendMode.srcATop),
                ),
                gutterSpace(vertical: 4),
                Text("Sea Level",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium),
                Text("1015",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: ThemeColors.highlight)),
              ],
            ).expanded(),
            const VerticalDivider(
                color: ThemeColors.onBackground,
                thickness: 1,
                width: 2,
                indent: 40,
                endIndent: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/ground.svg",
                  height: 40,
                  width: 40,
                  colorFilter: const ColorFilter.mode(
                      ThemeColors.onBackground, BlendMode.srcATop),
                ),
                gutterSpace(vertical: 4),
                Text("Ground Level",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium),
                Text("933",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: ThemeColors.highlight)),
              ],
            ).expanded(),
          ],
        ),
      ),
      context: context);
}

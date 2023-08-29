import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_weather/core/theme/theme_colors.dart';
import 'package:open_weather/core/utils/extensions.dart';
import 'package:open_weather/core/utils/gutter_space.dart';

////////////~~~~~~~ shift to card~~~~~~~~~~~~~~~

Widget cardWithTitle(
    {required String title,
    required BuildContext context,
    required List<CardWithTitleItem> items,
    bool alignRight = false}) {
  return Container(
    height: 160,
    margin: const EdgeInsets.fromLTRB(16, 42, 16, 0),
    child: Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            color: ThemeColors.onBackground.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: cardWithTitleInnerContainer(context: context, items: items),
        ),
        Positioned(
          top: 0,
          left: !alignRight ? 0 : null,
          right: alignRight ? 0 : null,
          child: Align(
            heightFactor: 0.01,
            child: Container(
              height: 32,
              width: 120,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: ThemeColors.highlight,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(
                title,
                textScaleFactor: 1,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget cardWithTitleInnerContainer(
    {required BuildContext context, required List<CardWithTitleItem> items}) {
  return IntrinsicHeight(
    child: Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              items[0].icon,
              height: 35,
              width: 35,
              colorFilter: const ColorFilter.mode(
                  ThemeColors.onBackground, BlendMode.srcATop),
            ),
            gutterSpace(vertical: 4),
            Text(items[0].label,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium),
            Text(items[0].info,
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
            indent: 35,
            endIndent: 35),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              items[1].icon,
              height: 35,
              width: 35,
              colorFilter: const ColorFilter.mode(
                  ThemeColors.onBackground, BlendMode.srcATop),
            ),
            gutterSpace(vertical: 4),
            Text(items[1].label,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium),
            Text(items[1].info,
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
            indent: 35,
            endIndent: 35),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              items[2].icon,
              height: 35,
              width: 35,
              colorFilter: const ColorFilter.mode(
                  ThemeColors.onBackground, BlendMode.srcATop),
            ),
            gutterSpace(vertical: 4),
            Text(items[2].label,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium),
            Text(items[2].info,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: ThemeColors.highlight)),
          ],
        ).expanded(),
      ],
    ),
  );
}

class CardWithTitleItem {
  final String label;
  final String icon;
  final String info;

  CardWithTitleItem(
      {required this.label, required this.icon, required this.info});
}

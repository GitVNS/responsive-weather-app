import 'package:flutter/material.dart';
import 'package:open_weather/core/theme/theme_colors.dart';

////////////~~~~~~~ shift to card~~~~~~~~~~~~~~~

Widget cardWithTitle(
    {required String title,
    required Widget child,
    required BuildContext context,
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
          child: child,
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

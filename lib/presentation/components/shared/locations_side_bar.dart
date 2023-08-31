import 'package:flutter/material.dart';
import 'package:open_weather/core/theme/theme_colors.dart';
import 'package:open_weather/core/utils/extensions.dart';
import 'package:open_weather/core/utils/gutter_space.dart';
import 'package:open_weather/data/locations.dart';

Widget locationsSideBar({required BuildContext context}) {
  return Container(
    width: 200,
    decoration: const BoxDecoration(
      border: Border(
        right: BorderSide(color: ThemeColors.onBackground, width: 0.5),
      ),
    ),
    child: Column(
      children: [
        ListView.separated(
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
        ).expanded(),
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ThemeColors.highlight,
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.search),
              Text("Search", style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ).symetricPadding(horizontal: 16, vertical: 16),
      ],
    ),
  );
}

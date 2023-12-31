import 'package:flutter/material.dart';

class ResponsiveContainer extends StatelessWidget {
  const ResponsiveContainer(
      {super.key,
      required this.mobile,
      required this.tablet,
      required this.desktop});

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1000 &&
      MediaQuery.of(context).size.width >= 600;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1000;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth >= 1000) {
          return desktop;
        } else if (constraints.maxWidth >= 600) {
          return tablet;
        } else {
          return mobile;
        }
      }),
    );
  }
}

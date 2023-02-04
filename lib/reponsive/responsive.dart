import 'package:flutter/material.dart';

class ResponsiveScreen extends StatelessWidget {
  static const double tablateWithLimit = 1100.0;
  static const double mobileWithLimit = 650.0;
  const ResponsiveScreen({
    super.key,
    required this.desktop,
    required this.tablate,
    required this.mobile,
  });
  final Widget desktop;
  final Widget tablate;
  final Widget mobile;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tablateWithLimit;

  static bool isTablate(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileWithLimit &&
      MediaQuery.of(context).size.width >= tablateWithLimit;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileWithLimit;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) {
        if (p1.maxWidth > tablateWithLimit) {
          return desktop;
        } else if (p1.maxWidth > mobileWithLimit) {
          return tablate;
        } else {
          return mobile;
        }
      },
    );
  }
}

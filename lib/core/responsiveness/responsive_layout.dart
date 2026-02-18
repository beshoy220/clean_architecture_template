import 'package:flutter/material.dart';

/// A widget that builds different layouts based on the screen size.
/// It takes three widgets as parameters: [mobile], [tablet], and an optional [desktop].
/// The layout is determined by the width of the screen:
/// - Mobile: width < 600
/// - Tablet: 600 <= width < 1024
/// - Desktop: width >= 1024
/// If the [desktop] widget is not provided, the [tablet] layout will be used for desktop screens as well.
/// Example usage:
/// ```dart
/// ResponsiveLayout(
///  mobile: Scaffold(body: Text('I am a mobile')),
///  tablet: Scaffold(body: Text('I am a tablet')),
///  desktop: Scaffold(body: Text('I am a desktop')),
/// );
/// ```
/// This widget is useful for creating responsive designs that adapt to different screen sizes without having to write separate code for each layout.
class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget? desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    required this.tablet,
    this.desktop,
  });

  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;

  static DeviceType getDeviceType(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    if (width < mobileBreakpoint) {
      return DeviceType.mobile;
    } else if (width < tabletBreakpoint) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceType = getDeviceType(context);

    if (deviceType == DeviceType.mobile) {
      return mobile;
    } else if (deviceType == DeviceType.tablet || desktop == null) {
      return tablet;
    } else if (deviceType == DeviceType.desktop && desktop != null) {
      return desktop!;
    } else {
      // This case should never happen, but we return an error widget just in case
      return Text(
        'Error: No Layout widget have been selected',
        style: TextStyle(color: Colors.red, fontSize: 18),
      );
    }
  }
}

enum DeviceType { mobile, tablet, desktop }

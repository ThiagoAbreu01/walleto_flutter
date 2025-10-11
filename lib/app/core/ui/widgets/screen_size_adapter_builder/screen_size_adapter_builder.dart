import 'package:flutter/material.dart';
import 'package:granio_flutter/app/core/helpers/screen_size_adapter.dart';

class ScreenSizeAdapterBuilder extends StatefulWidget {
  final Widget Function(BuildContext context) buildMobile;
  final Widget Function(BuildContext context) buildTablet;
  final Widget Function(BuildContext context) buildDesktop;

  const ScreenSizeAdapterBuilder({
    super.key,
    required this.buildMobile,
    required this.buildTablet,
    required this.buildDesktop,
  });

  @override
  State<ScreenSizeAdapterBuilder> createState() =>
      _ScreenSizeAdapterBuilderState();
}

class _ScreenSizeAdapterBuilderState extends State<ScreenSizeAdapterBuilder> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final screenSizeAdapter = ScreenSizeAdapter();

    if (screenSizeAdapter.isMobile(width)) {
      return widget.buildMobile(context);
    } else if (screenSizeAdapter.isTablet(width)) {
      return widget.buildTablet(context);
    } else {
      return widget.buildDesktop(context);
    }
  }
}

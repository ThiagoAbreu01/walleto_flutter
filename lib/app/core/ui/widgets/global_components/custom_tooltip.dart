import 'package:flutter/material.dart';

class CustomTooltip {
  CustomTooltip._();

  static AnimationController? tooltipController;
  static OverlayEntry? tooltipOverlayEntry;
  static bool isTooltipVisible = false;

  static void showTooltip({required BuildContext context}) {
    if (isTooltipVisible) {
      tooltipController?.reverse();
    }

    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    final tooltip = Tooltip(
      message: 'Custom Tooltip',
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'Custom Tooltip',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    const tooltipWidth = 150.0; // Width of the tooltip widget
    const tooltipHeight = 40.0; // Height of the tooltip widget

    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    double tooltipX = offset.dx - 100; // Adjust position as per your needs
    double tooltipY = offset.dy - 10; // Adjust position as per your needs

    if (tooltipX < 0) {
      tooltipX = 0; // Adjust position to start from the left edge
    }

    if (tooltipX + tooltipWidth > screenWidth) {
      tooltipX = screenWidth -
          tooltipWidth; // Adjust position to start from the right edge
    }

    if (tooltipY + tooltipHeight > screenHeight) {
      tooltipY =
          offset.dy - tooltipHeight - 10; // Adjust position as per your needs
    }

    tooltipOverlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: tooltipX,
        top: tooltipY,
        child: FadeTransition(
          opacity: tooltipController!,
          child: tooltip,
        ),
      ),
    );

    Overlay.of(context).insert(tooltipOverlayEntry!);
    tooltipController?.forward();
    isTooltipVisible = true;

    // Remove the tooltip after a delay
    Future.delayed(const Duration(seconds: 2), () {
      tooltipController?.reverse();
      isTooltipVisible = false;
    });
  }
}

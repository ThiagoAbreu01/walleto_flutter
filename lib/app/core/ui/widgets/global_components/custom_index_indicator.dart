// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:walleto_flutter/app/core/ui/extensions/size_screen_extension.dart';
import 'package:walleto_flutter/app/core/ui/extensions/theme_extension.dart';

// ignore: must_be_immutable
class CustomIndexIndicator extends StatefulWidget {
  int index;
  int itemCount;
  CustomIndexIndicator({
    super.key,
    required this.index,
    required this.itemCount,
  });

  @override
  State<CustomIndexIndicator> createState() => _CustomIndexIndicatorState();
}

class _CustomIndexIndicatorState extends State<CustomIndexIndicator> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      width: context.percentWidth(0.8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          widget.itemCount,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: widget.index == index ? 30 : 8,
            height: 8,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: context.isDarkTheme
                    ? context.secondaryColor
                    : context.tertiaryColor,
              ),
              color: widget.index == index
                  ? context.isDarkTheme
                      ? context.secondaryColor
                      : context.primaryColor
                  : context.primaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.only(right: 10),
          ),
        ),
      ),
    );
  }
}

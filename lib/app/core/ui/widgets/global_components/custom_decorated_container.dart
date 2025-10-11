// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:granio_flutter/app/core/ui/extensions/theme_extension.dart';
import 'package:granio_flutter/app/core/ui/widgets/global_components/custom_box_shadow.dart';
import 'package:flutter/material.dart';

class CustomDecoratedContainer extends StatefulWidget {
  final double width;
  final double height;
  final double? borderRadius;
  final Color? color;
  final bool hasBoxShadow;
  final Widget child;
  final Function()? onTap;
  const CustomDecoratedContainer({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
    this.color,
    required this.hasBoxShadow,
    required this.child,
    this.onTap,
  });

  @override
  State<CustomDecoratedContainer> createState() =>
      _CustomDecoratedContainerState();
}

class _CustomDecoratedContainerState extends State<CustomDecoratedContainer> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (widget.onTap == null) {
        return Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            color: widget.color ??
                (context.isDarkTheme
                    ? context.tertiaryContainer
                    : context.background),
            borderRadius: (widget.borderRadius == null) == false
                ? BorderRadius.circular(widget.borderRadius!)
                : BorderRadius.zero,
            boxShadow: widget.hasBoxShadow == true
                ? context.isDarkTheme
                    ? CustomBoxShadow(context: context).primaryBoxShadow()
                    : CustomBoxShadow(context: context).tertiaryBoxShadow()
                : null,
          ),
          child: widget.child,
        );
      } else {
        return Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            color: widget.color ??
                (context.isDarkTheme
                    ? context.tertiaryContainer
                    : context.background),
            borderRadius: (widget.borderRadius == null) == false
                ? BorderRadius.circular(widget.borderRadius!)
                : BorderRadius.zero,
            boxShadow: widget.hasBoxShadow == true
                ? context.isDarkTheme
                    ? CustomBoxShadow(context: context).primaryBoxShadow()
                    : CustomBoxShadow(context: context).tertiaryBoxShadow()
                : null,
          ),
          // child: widget.child,
          child: Material(
            color: Colors.transparent,
            borderRadius: (widget.borderRadius == null) == false
                ? BorderRadius.circular(widget.borderRadius!)
                : BorderRadius.zero,
            child: InkWell(
              onTap: widget.onTap,
              borderRadius: (widget.borderRadius == null) == false
                  ? BorderRadius.circular(widget.borderRadius!)
                  : BorderRadius.zero,
              child: widget.child,
            ),
          ),
        );
      }
    });
  }
}

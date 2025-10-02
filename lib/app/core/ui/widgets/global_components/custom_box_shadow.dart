// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:walleto_flutter/app/core/ui/extensions/theme_extension.dart';

class CustomBoxShadow {
  final BuildContext context;
  CustomBoxShadow({
    required this.context,
  });
  List<BoxShadow> primaryBoxShadow() {
    return [
      BoxShadow(
        color: context.primaryColor.withValues(alpha: 0.4),
        blurRadius: 1,
        offset: const Offset(0, 0),
        spreadRadius: 2,
      ),
    ];
  }

  List<BoxShadow> tertiaryBoxShadow() {
    return [
      BoxShadow(
        color: context.tertiaryColor.withValues(alpha: 0.4),
        blurRadius: 1,
        offset: const Offset(0, 0),
        spreadRadius: 2,
      ),
    ];
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:granio_flutter/app/core/ui/extensions/size_screen_extension.dart';
import 'package:granio_flutter/app/core/ui/extensions/theme_extension.dart';
import 'package:granio_flutter/app/core/ui/styles/text_styles.dart';

class CustomTextField extends StatefulWidget {
  final String name;
  final Color color;
  final List<BoxShadow>? boxShadow;
  final BorderRadius? radius;
  final double? height;
  final double? width;
  final String? label;
  final double? labelSize;
  final String? hint;
  final Color? hintColor;
  final double? hintSize;
  final Color? cursorColor;
  final Color? inputTextColor;
  final EdgeInsets? alturaText;
  final IconData? icon;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final Function()? suffixOnPressed;
  final Function()? prefixOnPressed;
  final String? Function(String? val)? validator;
  final GlobalKey<FormState>? formKeyForValidator;
  final double? iconSize;
  final Color? iconColor;
  final bool isPasswordField;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final int? maxLines;
  final TextEditingController textEditingController;
  final Function(String? newValue)? onChanged;
  final FocusNode? focusNode;
  final bool? enabled;
  final Function(String? value)? onSubmitted;

  const CustomTextField({
    super.key,
    required this.name,
    required this.color,
    this.boxShadow,
    this.radius,
    this.height,
    this.width,
    this.label,
    this.labelSize,
    this.hint,
    this.hintColor,
    this.hintSize,
    this.cursorColor,
    this.inputTextColor,
    this.icon,
    this.suffixIcon,
    this.suffixIconColor,
    this.suffixOnPressed,
    this.prefixOnPressed,
    this.validator,
    this.formKeyForValidator,
    this.iconSize,
    this.iconColor,
    required this.isPasswordField,
    this.inputFormatters = const [],
    this.textCapitalization,
    this.keyboardType,
    this.textInputAction,
    this.maxLength,
    this.maxLines,
    required this.textEditingController,
    this.onChanged,
    this.focusNode,
    this.enabled,
    this.alturaText,
    this.onSubmitted,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passwordVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? context.percentWidth(0.9),
      height: widget.height ?? 68,
      padding: EdgeInsets.only(
          left: 20,
          bottom: widget.maxLength != null ? 0.0 : 8.0,
          right: 20,
          top: widget.isPasswordField ? 13 : 10),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: widget.radius ?? BorderRadius.circular(50),
        boxShadow: widget.boxShadow ?? const [],
      ),
      child: Padding(
        padding: widget.alturaText ?? const EdgeInsets.only(bottom: 4.0),
        child: TextField(
          
          maxLines: widget.isPasswordField ? 1 : widget.maxLines ?? 1,
          cursorColor: widget.cursorColor ?? context.primaryColor,
          selectionControls: MaterialTextSelectionControls(),
          onSubmitted: widget.onSubmitted,
          enableInteractiveSelection: true,
          keyboardType: widget.keyboardType ?? TextInputType.name,
          controller: widget.textEditingController,
          style:
              TextStyle(color: widget.inputTextColor ?? context.primaryColor),
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: TextStyles.i.textFieldLabel.copyWith(
                fontSize: widget.hintSize ?? 14,
                color: widget.hintColor ?? Colors.grey),
            label: widget.label != null
                ? Text(
                    widget.label!,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: widget.labelSize ?? 14,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : null,
            labelStyle: TextStyles.i.textMedium.copyWith(fontSize: 5),
            helperStyle:
                widget.label != null ? TextStyles.i.textFieldLabel : null,
            prefixStyle:
                widget.label != null ? TextStyles.i.textFieldLabel : null,
            counterStyle:
                widget.label != null ? TextStyles.i.textFieldLabel : null,
            suffixStyle:
                widget.label != null ? TextStyles.i.textFieldLabel : null,
            floatingLabelStyle:
                widget.label != null ? TextStyles.i.textFieldLabel : null,
            focusedBorder: InputBorder.none,
            errorStyle: TextStyles.i.textFieldLabel
                .copyWith(color: context.error, fontSize: 7, height: 0),
            icon: widget.icon != null
                ? widget.prefixOnPressed != null
                    ? GestureDetector(
                        onTap: () {
                          widget.prefixOnPressed!();
                        },
                        child: Icon(
                          widget.icon,
                          color: widget.iconColor,
                          size: widget.iconSize ?? 30,
                        ),
                      )
                    : Icon(
                        widget.icon,
                        color: widget.iconColor,
                        size: widget.iconSize ?? 30,
                      )
                : null,
            border: InputBorder.none,
            suffixIcon: widget.isPasswordField
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        passwordVisibility = !passwordVisibility;
                      });
                    },
                    child: Icon(
                      passwordVisibility
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: context.primaryColor,
                      size: widget.iconSize ?? 30,
                    ),
                  )
                : widget.suffixIcon != null
                    ? GestureDetector(
                        onTap: widget.suffixOnPressed,
                        child: Icon(
                          widget.suffixIcon,
                          color:
                              widget.suffixIconColor ?? context.secondaryColor,
                          size: widget.iconSize ?? 30,
                        ),
                      )
                    : null,
          ),
          inputFormatters: widget.inputFormatters ?? const [],
          obscureText: widget.isPasswordField
              ? !passwordVisibility
                  ? true
                  : false
              : false,
          textInputAction: widget.textInputAction ?? TextInputAction.done,
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.words,
          onChanged: widget.onChanged ?? (newValue) {},
          focusNode: widget.focusNode,
          enabled: widget.enabled ?? true,
        ),
      ),
    );
  }
}

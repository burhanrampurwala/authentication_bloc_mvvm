import 'package:authentication_bloc_mvvm/common/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../dimensions/radius.dart';
import '../resources/app_color.dart';

class CustomTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final int? maxLines;
  final int? minLines;
  final String? labelText;
  final String? errorText;
  final String hintText;
  final TextEditingController? controller;
  final bool? isObscure;
  final TextInputType? keyboardType;
  final FontWeight? textFontWeight;
  final bool? enable;
  final ValueChanged<String>? onChanged;
  final int? charLength;
  final bool read;
  final double? textSize;
  final GestureTapCallback? onTap;
  final Decoration? decoration;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Color? hintColor;
  final TextAlign textAlign;
  final TextInputAction? textInputAction;
  final Color? fillColor;
  final Color borderColor;
  final bool isDense;
  final bool expands;
  final bool autoValidate;
  final EdgeInsetsGeometry? contentPadding;
  final FormFieldValidator<String>? validator;

  const CustomTextField({
    super.key,
    this.focusNode,
    this.errorText,
    this.labelText,
    required this.hintText,
    this.controller,
    this.isObscure = false,
    this.keyboardType,
    this.textFontWeight,
    this.enable,
    this.onChanged,
    this.charLength,
    this.onTap,
    this.textSize,
    this.maxLines = 1,
    this.minLines = 1,
    this.decoration,
    this.suffixIcon,
    this.prefixIcon,
    this.prefix,
    this.textAlign = TextAlign.start,
    this.hintColor = AppColors.hintStyleColor,
    this.textInputAction = TextInputAction.next,
    this.fillColor = Colors.white,
    this.borderColor = Colors.grey,
    this.isDense = false,
    this.read = false,
    this.expands = false,
    this.autoValidate = false,
    this.validator,
    this.contentPadding,
  });




  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration ??
          BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.grey.withOpacity(0.5),
                offset: const Offset(0, 1),
                blurRadius: containerBlurRadius,
              ),
            ],
            borderRadius: BorderRadius.circular(containerBoxRadius),
          ),
      child: TextFormField(
        focusNode: focusNode,
        autovalidateMode: autoValidate
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        textInputAction: textInputAction,
        inputFormatters: [
          LengthLimitingTextInputFormatter(charLength),
        ],
        textAlign: textAlign,
        expands: expands,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        autocorrect: false,
        enableSuggestions: true,
        autofocus: false,
        readOnly: read,
        onChanged: onChanged,
        minLines: minLines,
        maxLines: maxLines,
        enabled: enable ?? true,
        style: AppStyles().mediumWhiteTextStyle,
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: fillColor,
          filled: true,
          isDense: isDense,
          contentPadding: contentPadding,
          errorText: errorText,
          hintStyle: AppStyles().mediumGreyTextStyle,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          prefix: prefix,
          prefixIconColor: AppColors.grey,
          suffixIconColor: AppColors.grey,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(containerBoxRadius),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(containerBoxRadius),
            borderSide: BorderSide.none,
          ),
        ),
        controller: controller,
        obscureText: isObscure!,
        obscuringCharacter: '●',
        keyboardType: keyboardType,
        onTap: onTap,
        validator: validator,
      ),
    );
  }
}

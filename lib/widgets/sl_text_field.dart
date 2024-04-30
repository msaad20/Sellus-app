import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sellusapp/utils/constants/config_constant.dart';

class SlTextField extends StatelessWidget {
  final TextEditingController textController;
  final void Function(String)? onChanged;
  final String hintText;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final bool isMultiline;
  final bool isObsecure;
  final String? errorText;
  final int? maxLength;
  final int? minLines;
  final List<TextInputFormatter>? inputFormatters;
  final bool isEnabled;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final TextStyle? textStyle;

  const SlTextField({
    super.key,
    required this.textController,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.onChanged,
    this.leadingIcon,
    this.trailingIcon,
    this.isMultiline = false,
    this.isObsecure = false,
    this.isEnabled = true,
    this.errorText,
    this.maxLength,
    this.minLines,
    this.textStyle,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      onChanged: onChanged,
      minLines: minLines,
      maxLength: maxLength,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      cursorColor: Theme.of(context).primaryColor,
      style: textStyle,
      controller: textController,
      obscureText: isObsecure,
      maxLines: isMultiline ? double.maxFinite.toInt() : 1,
      decoration: InputDecoration(
        enabled: isEnabled,
        hintText: hintText,
        prefixIcon: leadingIcon,
        suffixIcon: trailingIcon,
        errorText: errorText,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: ConfigConstant.circlarRadius2,
        ),
      ),
    );
  }
}

class SlTextFormField extends StatelessWidget {
  final TextEditingController textController;
  final void Function(String)? onChanged;
  final String hintText;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final bool isMultiline;
  final bool isObsecure;
  final String? errorText;
  final int? maxLength;
  final int? minLines;
  final bool isEnabled;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;

  const SlTextFormField({
    super.key,
    required this.textController,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.leadingIcon,
    this.trailingIcon,
    this.isMultiline = false,
    this.isObsecure = false,
    this.isEnabled = true,
    this.errorText,
    this.maxLength,
    this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      minLines: minLines,
      maxLength: maxLength,
      keyboardType: keyboardType,
      controller: textController,
      obscureText: isObsecure,
      maxLines: isMultiline ? double.maxFinite.toInt() : 1,
      decoration: InputDecoration(
        enabled: isEnabled,
        hintText: hintText,
        prefixIcon: leadingIcon,
        suffixIcon: trailingIcon,
        errorText: errorText,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: ConfigConstant.circlarRadius2,
        ),
      ),
    );
  }
}

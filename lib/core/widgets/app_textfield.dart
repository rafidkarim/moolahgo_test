import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextAlign textAlign;
  final TextEditingController? textEditingController;
  final bool obscure;
  final bool enabled;
  final bool dropShadow;
  final Color? fillColor;
  final double contentVertical;
  final double contentHorizontal;
  final Function(String value)? onChanged;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;

  const AppTextField(
      {super.key,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.textEditingController,
      this.textAlign = TextAlign.start,
      this.fillColor,
      this.contentHorizontal = 15,
      this.contentVertical = 15,
      this.dropShadow = true,
      this.obscure = false,
      this.onChanged,
      this.enabled = true,
      this.textInputType,
      this.focusNode,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: dropShadow
              ? [
                  BoxShadow(
                      color: Colors.black12.withOpacity(0.05),
                      blurRadius: 10,
                      spreadRadius: 0.1,
                      offset: Offset(0, 7))
                ]
              : null),
      child: TextField(
        keyboardType: textInputType,
        inputFormatters: [],
        controller: textEditingController,
        obscureText: obscure,
        onChanged: onChanged,
        enabled: enabled,
        textAlign: textAlign,
        focusNode: focusNode,
        style: theme.textTheme.bodyLarge,
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintStyle: (contentVertical) == 15
                ? theme.textTheme.bodySmall
                : theme.textTheme.bodySmall!
                    .copyWith(fontSize: (contentVertical) * 2.5),
            filled: true,
            fillColor: fillColor ?? Colors.white,
            contentPadding: EdgeInsets.symmetric(
                vertical: contentVertical, horizontal: contentHorizontal),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: theme.primaryColor),
                borderRadius: BorderRadius.circular(50)),
            disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.white),
                borderRadius: BorderRadius.circular(50)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.white),
                borderRadius: BorderRadius.circular(50)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.white),
                borderRadius: BorderRadius.circular(50))),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputField extends StatelessWidget {
  final int maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final double radius;
  final double? space;
  final Widget? prefixIcon;
  final Function(String)? onSubmitted;
  final Function(String)? onChange;
  final EdgeInsets? scrollPadding;

  const CustomInputField({
    super.key,
    this.controller,
    this.hintText,
    this.inputFormatters,
    this.keyboardType,
    this.labelText,
    this.maxLength,
    this.maxLines = 1,
    this.radius = 8,
    this.space,
    this.onSubmitted,  this.prefixIcon, this.onChange,  this.scrollPadding,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      children: [
        TextField(
          //scrollPadding: scrollPadding,
          onChanged: onChange,
            onSubmitted: onSubmitted,
            controller: controller,
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            maxLength: maxLength,
            maxLines: maxLines,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colors.primary, width: 1.5),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: colors.secondary),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              filled: false,
              hintText: hintText,
              labelText: labelText,
              isDense: true,
              prefixIcon: prefixIcon
            
            )),
        SizedBox(
          height: space ?? 20,
        ),
      ],
    );
  }
}

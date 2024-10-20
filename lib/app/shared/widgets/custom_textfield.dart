import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.labelText,
    this.helperText,
    this.maxLength,
    this.maxLines,
    this.obscureText = false,
    this.canChange = false,
    this.enabled,
    this.isNotRequired = false,
    this.keyboardType = TextInputType.text,
  });

  final TextEditingController controller;
  final bool obscureText;
  final bool canChange;
  final bool? enabled;
  final bool isNotRequired;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final int? maxLength;
  final int? maxLines;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return TextFormField(
      autocorrect: false,
      enabled: enabled,
      controller: controller,
      obscureText: obscureText,
      onTapOutside: (event) {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      cursorColor: canChange
          ? Theme.of(context).colorScheme.inversePrimary
          : AppColors.white,
      cursorErrorColor: AppColors.red,
      style: GoogleFonts.raleway(
        color: canChange
            ? Theme.of(context).colorScheme.inversePrimary
            : AppColors.white,
        fontWeight: FontWeight.w600,
        fontSize: 15,
      ),
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: canChange
              ? Theme.of(context).colorScheme.inversePrimary
              : AppColors.white,
          fontWeight: FontWeight.normal,
          fontSize: 13,
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.raleway(
          color: Colors.grey.shade700,
          fontSize: 15,
          fontWeight: FontWeight.normal,
        ),
        disabledBorder: InputBorder.none,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.blackO,
            style: BorderStyle.solid,
            width: 1,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: canChange
                ? Theme.of(context).colorScheme.inversePrimary
                : AppColors.white,
            style: BorderStyle.solid,
            width: 1,
          ),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.red,
            style: BorderStyle.solid,
            width: 1,
          ),
        ),
        helperText: helperText,
        helperMaxLines: 2,
        helperStyle: GoogleFonts.raleway(
          color: canChange
              ? Theme.of(context).colorScheme.inversePrimary
              : AppColors.white,
          fontSize: width * 0.025,
          fontWeight: FontWeight.w300,
        ),
      ),
      validator: isNotRequired
          ? null
          : (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez remplir ce champ !';
              }
              return null;
            },
    );
  }
}

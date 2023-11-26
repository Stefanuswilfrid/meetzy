import 'package:flutter/material.dart';

enum InputFormType {
  normal,
  password,
  button,
}

class InputFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String value)? onChanged;
  final bool isObscure;
  final IconData? prefixIcon;
  final Function()? onObscureTap;
  final InputFormType inputFormType;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? errorText;
  final String? Function(String?)? validator;

  const InputFormWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.onChanged,
    this.errorText,
    this.validator,
  })  : inputFormType = InputFormType.normal,
        isObscure = false,
        readOnly = false,
        onTap = null,
        onObscureTap = null;

  const InputFormWidget.password({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.onChanged,
    this.isObscure = true,
    this.onObscureTap,
    this.errorText,
    this.validator,
  })  : inputFormType = InputFormType.password,
        readOnly = false,
        onTap = null;

  bool get isPassword => inputFormType == InputFormType.password;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      obscureText: isObscure,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      decoration: InputDecoration(
        errorText: errorText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey[50]!,
            width: 12,
          ),
        ),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: isPassword
            ? GestureDetector(
                onTap: onObscureTap,
                child: Icon(
                  !isObscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 26,
                  color: Colors.grey.shade400,
                ),
              )
            : const SizedBox.shrink(),
      ),
      readOnly: readOnly,
      onTap: onTap,
      style: const TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        color: Color(0xFF120D26),
      ),
    );
  }
}

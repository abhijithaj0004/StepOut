import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KTextField extends StatelessWidget {
  const KTextField({
    super.key,
    required this.hint,
    this.controller,
    this.keyBoardType,
    this.obscureText = false, this.sufixIcon,
  });
  final String hint;
  final TextEditingController? controller;
  final TextInputType? keyBoardType;
  final bool obscureText;
  final Widget? sufixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyBoardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: sufixIcon,
        focusedBorder: const OutlineInputBorder(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: hint,
        hintStyle: GoogleFonts.itim(
            textStyle: const TextStyle(
                fontSize: 22, color: Color.fromARGB(255, 140, 140, 140))),
      ),
    );
  }
}

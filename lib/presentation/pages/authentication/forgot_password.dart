import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/presentation/constants/constants.dart';
import 'package:stepout/presentation/constants/combonents/constant_button.dart';
import 'package:stepout/presentation/functions/auth_fns.dart';

class ForgotPassWordPage extends StatelessWidget {
  ForgotPassWordPage({super.key});
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final authFn = AuthFn();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const StepOutImg(
                    height: 150,
                  ),
                  Text(
                    'Enter your Email and we will send you a Password reset link',
                    style: GoogleFonts.itim(
                      textStyle: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  kheight20,
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email required';
                      }
                      return null;
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Enter Email',
                      hintStyle: GoogleFonts.itim(
                          textStyle: const TextStyle(
                              fontSize: 22,
                              color: Color.fromARGB(255, 140, 140, 140))),
                    ),
                  ),
                  kheight20,
                  KButton(
                      onClick: () {
                        if (formKey.currentState!.validate()) {
                          authFn.resetPassword(
                              emailController.text.trim(), context);
                        }
                      },
                      label: Center(
                        child: Text(
                          'Reset Password',
                          style: GoogleFonts.itim(
                              textStyle: TextStyle(fontSize: 20),
                              color: Colors.white),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

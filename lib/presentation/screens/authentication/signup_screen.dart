import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/businesslogic/hidepassword/hide_password_cubit.dart';
import 'package:stepout/presentation/core/constants.dart';
import 'package:stepout/presentation/core/combonents/constant_button.dart';
import 'package:stepout/presentation/functions/auth_fns.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassWordController = TextEditingController();
  final fomrKey = GlobalKey<FormState>();
  final authFn = AuthFn();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: fomrKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const StepOutImg(
                    height: 170,
                  ),
                  kheight20,
                  Text(
                    'Welcome to STEP OUT',
                    style: GoogleFonts.itim(
                        textStyle: const TextStyle(
                      fontSize: 32,
                      color: Color.fromARGB(255, 104, 103, 103),
                    )),
                  ),
                  kheight10,
                  Text(
                    'Sign Up and Continue',
                    style: GoogleFonts.itim(
                        textStyle: const TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 54, 54, 54))),
                  ),
                  kheight30,
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    },
                    // controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: 'Enter Your Name',
                      hintStyle: GoogleFonts.itim(
                          textStyle: const TextStyle(
                              fontSize: 22,
                              color: Color.fromARGB(255, 140, 140, 140))),
                    ),
                  ),
                  kheight30,
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      return null;
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: 'Enter Your Email',
                      hintStyle: GoogleFonts.itim(
                          textStyle: const TextStyle(
                              fontSize: 22,
                              color: Color.fromARGB(255, 140, 140, 140))),
                    ),
                  ),
                  kheight30,
                  BlocBuilder<HidePasswordCubit, HidePasswordState>(
                    builder: (context, state) {
                      return TextFormField(
                        obscureText: state.ischanged,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                        controller: passwordController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                context.read<HidePasswordCubit>().toggle();
                              },
                              icon: Icon(state.ischanged
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          focusedBorder: const OutlineInputBorder(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: 'Enter Password',
                          hintStyle: GoogleFonts.itim(
                              textStyle: const TextStyle(
                                  fontSize: 22,
                                  color: Color.fromARGB(255, 140, 140, 140))),
                        ),
                      );
                    },
                  ),
                  kheight30,
                  TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'password is required';
                      }
                      return null;
                    },
                    controller: confirmPassWordController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: 'Confirm Password',
                      hintStyle: GoogleFonts.itim(
                          textStyle: const TextStyle(
                              fontSize: 22,
                              color: Color.fromARGB(255, 140, 140, 140))),
                    ),
                  ),
                  kheight30,
                  KButton(
                      onClick: () {
                        if (fomrKey.currentState!.validate()) {
                          authFn.SignUp(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                              confirmPassWordController.text.trim(),
                              context);
                        }
                      },
                      label: Center(
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.itim(
                            textStyle: const TextStyle(
                                color: Colors.white, fontSize: 25),
                          ),
                        ),
                      )),
                  kheight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an Account?',
                        style: GoogleFonts.itim(
                            textStyle: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 129, 129, 129))),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          ' Sign In',
                          style: GoogleFonts.itim(
                              textStyle: const TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 0, 0, 0))),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

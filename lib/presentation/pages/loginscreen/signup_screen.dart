import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/presentation/constants/constants.dart';
import 'package:stepout/presentation/constants/constantwidgets/constant_button.dart';
import 'package:stepout/presentation/constants/constantwidgets/constant_textfield.dart';
import 'package:stepout/presentation/pages/homescreen/home_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
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
                KTextField(hint: 'Enter Your Name'),
                kheight30,
                KTextField(
                    keyBoardType: TextInputType.emailAddress,
                    hint: 'Enter Your Email'),
                kheight30,
                KTextField(
                    sufixIcon: Icon(Icons.remove_red_eye_outlined),
                    obscureText: true,
                    hint: 'Enter Password'),
                kheight30,
                KTextField(obscureText: true, hint: 'Confirm Password'),
                kheight30,
                KButton(
                    onClick: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                          (route) => false);
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
            )),
      ),
    );
  }
}

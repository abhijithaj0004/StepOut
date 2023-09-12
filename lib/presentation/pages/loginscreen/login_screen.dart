import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/presentation/constants/constantwidgets/constant_button.dart';
import 'package:stepout/presentation/constants/constants.dart';
import 'package:stepout/presentation/constants/constantwidgets/constant_textfield.dart';
import 'package:stepout/presentation/pages/loginscreen/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            StepOutImg(
              height: 170,
            ),
            kheight20,
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome to STEP OUT',
                  style: GoogleFonts.itim(
                      textStyle: const TextStyle(
                          fontSize: 32,
                          color: Color.fromARGB(255, 104, 103, 103),
                          letterSpacing: 1)),
                ),
                kheight10,
                Text(
                  'Sign In and Continue',
                  style: GoogleFonts.itim(
                      textStyle: const TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 54, 54, 54))),
                ),
                kheight20,
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Column(
                    children: [
                      KTextField(
                        hint: 'Enter Email',
                      ),
                      kheight30,
                      KTextField(hint: 'Enter Password'),
                      kheight30,
                      KButton(
                          label: Center(
                        child: Text(
                          'Sign In',
                          style: GoogleFonts.itim(
                            textStyle: const TextStyle(
                                color: Colors.white, fontSize: 25),
                          ),
                        ),
                      )),
                      kheight10,
                      Text(
                        'OR',
                        style: GoogleFonts.itim(
                            textStyle: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 54, 54, 54))),
                      ),
                      kheight10,
                      KButton(
                          label: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.025,
                            ),
                            Image.asset(
                              'lib/presentation/images/googlenew.png',
                              height: 50,
                            ),
                            SizedBox(
                              width: size.width * 0.025,
                            ),
                            Text(
                              'Continue with Google',
                              style: GoogleFonts.itim(
                                textStyle: const TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                          ],
                        ),
                      )),
                      kheight20,
                      Text(
                        'Forgot Password?',
                        style: GoogleFonts.itim(
                            textStyle: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 129, 129, 129))),
                      ),
                      kheight20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Do you have an Account?',
                            style: GoogleFonts.itim(
                                textStyle: const TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 129, 129, 129))),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ));
                            },
                            child: Text(
                              ' Sign Up',
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

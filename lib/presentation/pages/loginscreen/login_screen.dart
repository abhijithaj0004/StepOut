import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/presentation/constants/constantwidgets/constant_button.dart';
import 'package:stepout/presentation/constants/constants.dart';
import 'package:stepout/presentation/constants/constantwidgets/constant_textfield.dart';
import 'package:stepout/presentation/functions/auth_fns.dart';
import 'package:stepout/presentation/pages/loginscreen/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthFn authFn = AuthFn();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                'Sign In and Continue',
                style: GoogleFonts.itim(
                    textStyle: const TextStyle(
                        fontSize: 22, color: Color.fromARGB(255, 54, 54, 54))),
              ),
              kheight20,
              KTextField(
                controller: emailController,
                keyBoardType: TextInputType.emailAddress,
                hint: 'Enter Email',
              ),
              kheight30,
              KTextField(
                  controller: passwordController,
                  sufixIcon: Icon(Icons.remove_red_eye_outlined),
                  obscureText: true,
                  hint: 'Enter Password'),
              kheight30,
              KButton(
                  onClick: () {
                    //  signIn();
                  },
                  label: Center(
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.itim(
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  )),
              kheight10,
              Text(
                'OR',
                style: GoogleFonts.itim(
                    textStyle: const TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 54, 54, 54))),
              ),
              kheight10,
              KButton(
                  onClick: () async {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          Center(child: CircularProgressIndicator()),
                    );
                    await Future.delayed(Duration(seconds: 1));
                    Navigator.pop(context);
                    authFn.signInWithGoogle(context);
                  },
                  label: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/presentation/images/googlenew.png',
                          height: 50,
                        ),
                        SizedBox(
                          width: size.width * 0.025,
                        ),
                        Text(
                          'Continue with Google',
                          overflow: TextOverflow.ellipsis,
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
      ),
    );
  }

  // Future<void> signIn() async {
  //   // await FirebaseAuth.instance.signInWithEmailAndPassword(
  //   //     email: emailController.text.trim(),
  //   //     password: passwordController.text.trim());
  //   // log('fff');

  //   // final user = FirebaseAuth.instance.currentUser;

  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text.trim(),
  //       password: passwordController.text.trim(),
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     // if (e.code == 'user-not-found') {
  //     //   log('No user found for that email.');
  //     // } else if (e.code == 'wrong-password') {
  //     //   log('Wrong password provided for that user.');
  //     // }
  //     log(e.code);
  //   }
  // }
}

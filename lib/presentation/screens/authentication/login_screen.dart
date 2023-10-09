import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/businesslogic/hidepassword/hide_password_cubit.dart';
import 'package:stepout/presentation/core/combonents/constant_button.dart';
import 'package:stepout/presentation/core/constants.dart';
import 'package:stepout/presentation/functions/auth_fns.dart';
import 'package:stepout/presentation/screens/authentication/forgot_password.dart';
import 'package:stepout/presentation/screens/authentication/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final AuthFn authFn = AuthFn();

  final formkey = GlobalKey<FormState>();

  // bool isChanged = true;
  @override
  Widget build(BuildContext context) {
    // final hidePassword = context.read<ObscureText>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formkey,
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
                          fontSize: 22,
                          color: Color.fromARGB(255, 54, 54, 54))),
                ),
                kheight20,
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email Required';
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
                    hintText: 'Enter Email',
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password Required';
                        }
                        return null;
                      },
                      controller: passwordController,
                      obscureText: state.ischanged,
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: 'Enter Password',
                        suffixIcon: IconButton(
                            onPressed: () {
                              context.read<HidePasswordCubit>().toggle();
                            },
                            icon: Icon(state.ischanged
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        hintStyle: GoogleFonts.itim(
                            textStyle: const TextStyle(
                                fontSize: 22,
                                color: Color.fromARGB(255, 140, 140, 140))),
                      ),
                    );
                  },
                ),
                kheight30,
                KButton(
                    onClick: () {
                      if (formkey.currentState!.validate()) {
                        authFn.signIn(context, emailController.text.trim(),
                            passwordController.text.trim());
                      }
                    },
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
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ForgotPassWordPage(),
                    ));
                  },
                  child: Text(
                    'Forgot Password?',
                    style: GoogleFonts.itim(
                        textStyle: const TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 129, 129, 129))),
                  ),
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
      ),
    );
  }
}

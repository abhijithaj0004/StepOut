import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthFn {
  AuthFn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<UserCredential> signInWithGoogle(context) async {
    // Trigger the authentication flow

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    showDialog(
      context: context,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );
    await Future.delayed(Duration(seconds: 2));
    Navigator.pop(context);
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    log(googleSignIn.currentUser!.email);
    log(googleUser?.displayName ?? 'dd');
    log(googleSignIn.currentUser?.photoUrl ?? 'ff');

    // Once signed in, return the UserCredential
    return await firebaseAuth.signInWithCredential(credential);
  }

  Future<void> signOutWithGoogle() async {
    // Sign out with firebase
    await firebaseAuth.signOut();
    // Sign out with google
    await googleSignIn.signOut();
  }
   Future<void> signIn(context,email,password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          e.code,
          style: GoogleFonts.itim(textStyle: TextStyle(fontSize: 20)),
        ),
        duration: Duration(milliseconds: 1000),
      ));
    }
  }
   SignUp(email, password, confirmPassword, context) async {
    try {
      if (password == confirmPassword) {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("password don't match")));
      }
      
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.code)));
    }
  }
   resetPassword(email, context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Password Reset request send',
          style: GoogleFonts.itim(textStyle: TextStyle(fontSize: 20)),
        ),
        duration: Duration(milliseconds: 1000),
      ));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          e.code,
          style: GoogleFonts.itim(textStyle: TextStyle(fontSize: 20)),
        ),
        duration: Duration(milliseconds: 1000),
      ));
    }
  }
}

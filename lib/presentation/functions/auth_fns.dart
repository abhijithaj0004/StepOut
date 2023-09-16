import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
}

import 'package:flutter/material.dart';
import 'package:stepout/presentation/auth.dart';


class SplashScreen extends StatelessWidget {
 const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    gotoLogin(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('lib/presentation/images/stepoutwhite.png'),
      ),
    );
  }

  gotoLogin(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
   await Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => Auth(),
    ));
  }
}

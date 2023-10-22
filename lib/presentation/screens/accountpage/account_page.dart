import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/presentation/core/constants.dart';
import 'package:stepout/presentation/screens/accountpage/edit_user.dart';
import 'package:stepout/presentation/screens/settings/settings.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});
  final String? displayName = FirebaseAuth.instance.currentUser?.displayName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Profile',
          style: GoogleFonts.itim(
              textStyle: const TextStyle(fontSize: 25, color: Colors.black)),
        ),
        leading: const StepOutImg(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                    width: 150,
                    height: 150,
                    decoration:const BoxDecoration(shape: BoxShape.circle),
                    child: Image.network(
                      FirebaseAuth.instance.currentUser?.photoURL ??
                          'https://i.stack.imgur.com/l60Hf.png',
                      fit: BoxFit.cover,
                    )),
              ),
              kheight20,
              Text(
                displayName ?? 'User1',
                style: GoogleFonts.itim(
                    textStyle:
                        const TextStyle(fontSize: 20, color: Colors.black)),
              ),
              kheight10,
              Text(
                FirebaseAuth.instance.currentUser?.email ?? 'user1@gmail.com',
                style: GoogleFonts.itim(
                    textStyle:
                        const TextStyle(fontSize: 20, color: Colors.black)),
              ),
              kheight30,
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => EditUserPage(displayName: displayName,),
                  );
                },
                child: Container(
                  padding:
                   const   EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 181, 181, 181)),
                      borderRadius: BorderRadius.circular(7)),
                  child: Text(
                    'EDIT PROFILE',
                    style: GoogleFonts.itim(
                        textStyle:
                            const TextStyle(fontSize: 20, color: Colors.black)),
                  ),
                ),
              ),
              kheight30,
            const  Divider(
                thickness: 1,
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ));
                },
                leading:const Icon(Icons.settings),
                title: Text(
                  'Settings',
                  style: GoogleFonts.itim(
                      textStyle:
                          const TextStyle(fontSize: 20, color: Colors.black)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

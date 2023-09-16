import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/presentation/constants/constants.dart';
import 'package:stepout/presentation/functions/auth_fns.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: StepOutImg()),
        title: Text(
          'Settings',
          style: GoogleFonts.itim(
              textStyle: TextStyle(fontSize: 30, color: Colors.black)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kheight30,
            ListTile(
              title: Text(
                'Privacy Policy',
                style: GoogleFonts.itim(
                    textStyle: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 137, 137, 137))),
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              title: Text(
                'Terms and Conditions',
                style: GoogleFonts.itim(
                    textStyle: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 137, 137, 137))),
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              title: Text(
                'Get Support',
                style: GoogleFonts.itim(
                    textStyle: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 137, 137, 137))),
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              title: Text(
                'About this Version',
                style: GoogleFonts.itim(
                    textStyle: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 137, 137, 137))),
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Are you sure?'),
                    content: Text(
                      "You'll need to Login again to keep using the application",
                      style: GoogleFonts.itim(
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 20)),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'CANCEL',
                          style: GoogleFonts.itim(
                              textStyle: TextStyle(
                            color: Colors.black,
                          )),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          AuthFn().signOutWithGoogle();
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text(
                          'LOG OUT',
                          style: GoogleFonts.itim(
                              textStyle: TextStyle(
                            color: Colors.black,
                          )),
                        ),
                      )
                    ],
                  ),
                );
              },
              title: Text(
                'Log Out',
                style: GoogleFonts.itim(
                    textStyle: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 222, 85, 85))),
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}

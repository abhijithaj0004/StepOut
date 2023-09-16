import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/presentation/constants/constants.dart';
import 'package:stepout/presentation/constants/constantwidgets/constant_main_container.dart';
import 'package:stepout/presentation/functions/auth_fns.dart';
import 'package:stepout/presentation/pages/cartpage/cart_page.dart';
import 'package:stepout/presentation/pages/settings/settings.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final AuthFn authFn = AuthFn();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Step Out',
            style: GoogleFonts.itim(
                textStyle: TextStyle(fontSize: 30, color: Colors.black)),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  // authFn.signOutWithGoogle();
                },
                icon: Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () async {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ));
                },
                icon: FaIcon(
                  FontAwesomeIcons.bagShopping,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () async {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Settings(),
                  ));
                },
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                )),
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New Arrivals',
                style: GoogleFonts.itim(
                    textStyle: TextStyle(fontSize: 25, color: Colors.black)),
              ),
              kheight20,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    MainContainer(
                      height: size * 0.5,
                      width: size * 0.4,
                    ),
                    kWidth20,
                    MainContainer(
                      height: size * 0.5,
                      width: size * 0.4,
                    ),
                    kWidth20,
                    MainContainer(
                      height: size * 0.5,
                      width: size * 0.4,
                    ),
                  ],
                ),
              ),
              kheight20,
              Text(
                'Retro Running',
                style: GoogleFonts.itim(
                    textStyle:
                        const TextStyle(fontSize: 25, color: Colors.black)),
              ),
              kheight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainContainer(
                    width: size * 0.27,
                    height: size * 0.32,
                  ),
                  MainContainer(
                    width: size * 0.27,
                    height: size * 0.32,
                  ),
                  MainContainer(
                    width: size * 0.27,
                    height: size * 0.32,
                  ),
                ],
              ),
              kheight30,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainContainer(
                    width: size * 0.27,
                    height: size * 0.32,
                  ),
                  MainContainer(
                    width: size * 0.27,
                    height: size * 0.32,
                  ),
                  MainContainer(
                    width: size * 0.27,
                    height: size * 0.32,
                  ),
                ],
              ),
              kheight30,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainContainer(
                    width: size * 0.27,
                    height: size * 0.32,
                  ),
                  MainContainer(
                    width: size * 0.27,
                    height: size * 0.32,
                  ),
                  MainContainer(
                    width: size * 0.27,
                    height: size * 0.32,
                  ),
                ],
              )
            ],
          ),
        )));
  }
}

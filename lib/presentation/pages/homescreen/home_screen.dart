import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/presentation/constants/constants.dart';
import 'package:stepout/presentation/constants/combonents/constant_main_container.dart';
import 'package:stepout/presentation/functions/auth_fns.dart';
import 'package:stepout/presentation/pages/cartpage/cart_page.dart';
import 'package:stepout/presentation/pages/favoritepage/fav_page.dart';
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
                textStyle: const TextStyle(fontSize: 30, color: Colors.black)),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () async {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CartPage(),
                  ));
                },
                icon: const FaIcon(
                  FontAwesomeIcons.bagShopping,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () async {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Settings(),
                  ));
                },
                icon: const Icon(
                  Icons.settings,
                  color: Colors.black,
                )),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: SingleChildScrollView(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New Arrivals',
                  style: GoogleFonts.itim(
                      textStyle:
                          const TextStyle(fontSize: 25, color: Colors.black)),
                ),
                kheight20,
                SizedBox(
                  height: size * 0.7,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MainContainer(
                              height: size * 0.5,
                              width: size * 0.4,
                              child: Image.asset(imgUrl[index]),
                            ),
                            kheight10,
                            SizedBox(
                              width: size * 0.4,
                              child: Text(
                                'Asics gel Contend ${index + 1}',
                                style: GoogleFonts.itim(
                                    textStyle: TextStyle(fontSize: 15)),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                kheight20,
                Text(
                  'Retro Running',
                  style: GoogleFonts.itim(
                      textStyle:
                          const TextStyle(fontSize: 25, color: Colors.black)),
                ),
                kheight10,
                Flexible(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: imgUrl.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MainContainer(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            height: size * 0.5,
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Align(
                                    alignment: Alignment.topRight,
                                    child: CircleAvatar(
                                      child: Icon(Icons.favorite_outline),
                                    ),
                                  ),
                                ),
                                Center(child: Image.asset(imgUrl[index])),
                              ],
                            ),
                          ),
                          Text(
                            'Asics Gel Contend 7',
                            style: GoogleFonts.itim(
                                textStyle: const TextStyle(
                                    fontSize: 17, color: Colors.black)),
                          ),
                          Text(
                            'MRP : ₹ 14,995',
                            style: GoogleFonts.itim(
                                textStyle: const TextStyle(
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 127, 127, 127))),
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            )),
          ),
        ));
  }
}

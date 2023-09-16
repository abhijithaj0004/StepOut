import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/presentation/constants/constants.dart';
import 'package:stepout/presentation/constants/constantwidgets/constant_button.dart';
import 'package:stepout/presentation/constants/constantwidgets/constant_main_container.dart';
import 'package:stepout/presentation/pages/favoritepage/fav_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Bag',
          style: GoogleFonts.itim(textStyle: TextStyle(fontSize: 25)),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          MainContainer(
                            width: 100,
                            height: 100,
                            child: Image.asset(imgUrl[index]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Grand Shark',
                                  style: GoogleFonts.itim(
                                      textStyle: TextStyle(fontSize: 20)),
                                ),
                                kheight10,
                                Text("Men's Shoes",
                                    style: GoogleFonts.itim(
                                        textStyle: TextStyle(
                                            fontSize: 17,
                                            color: const Color.fromARGB(
                                                255, 114, 113, 113)))),
                                Text('Midnight Rainbow$index',
                                    style: GoogleFonts.itim(
                                        textStyle: TextStyle(
                                            fontSize: 17,
                                            color: const Color.fromARGB(
                                                255, 114, 113, 113)))),
                                Text('size 6.5',
                                    style: GoogleFonts.itim(
                                        textStyle: TextStyle(
                                            fontSize: 17,
                                            color: const Color.fromARGB(
                                                255, 114, 113, 113)))),
                              ],
                            ),
                          ),
                        ],
                      ),
                      kheight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Qty ${index + 1}',
                                style: GoogleFonts.itim(
                                  textStyle: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                              Icon(Icons.arrow_drop_down)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('MRP : \$1000.00',
                                  style: GoogleFonts.itim(
                                      textStyle: TextStyle(
                                    fontSize: 17,
                                  ))),
                              Text('incl. of taxes',
                                  style: GoogleFonts.itim(
                                      textStyle: TextStyle(
                                          fontSize: 16,
                                          color: const Color.fromARGB(
                                              255, 114, 113, 113)))),
                              Text('(Also includes all applicable duties)',
                                  style: GoogleFonts.itim(
                                      textStyle: TextStyle(
                                          fontSize: 16,
                                          color: const Color.fromARGB(
                                              255, 114, 113, 113)))),
                            ],
                          ),
                        ],
                      ),
                      kheight20
                    ],
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  thickness: 1,
                ),
                itemCount: 3,
              ),
            ),
            Column(
              children: [
                Divider(
                  thickness: 2,
                ),
                kheight30,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Subtotal',
                        style: GoogleFonts.itim(
                            textStyle: TextStyle(
                                fontSize: 17,
                                color:
                                    const Color.fromARGB(255, 114, 113, 113)))),
                    Text('\$2000.00',
                        style: GoogleFonts.itim(
                            textStyle: TextStyle(
                                fontSize: 17,
                                color:
                                    const Color.fromARGB(255, 114, 113, 113)))),
                  ],
                ),
                kheight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Shipping',
                        style: GoogleFonts.itim(
                            textStyle: TextStyle(
                                fontSize: 17,
                                color:
                                    const Color.fromARGB(255, 114, 113, 113)))),
                    Text('\$201.00',
                        style: GoogleFonts.itim(
                            textStyle: TextStyle(
                                fontSize: 17,
                                color:
                                    const Color.fromARGB(255, 114, 113, 113)))),
                  ],
                ),
                kheight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Estimated Total',
                        style: GoogleFonts.itim(
                            textStyle: TextStyle(
                          fontSize: 17,
                        ))),
                    Text('\$2201.00',
                        style: GoogleFonts.itim(
                            textStyle: TextStyle(
                          fontSize: 17,
                        ))),
                  ],
                ),
                kheight20
              ],
            ),
            KButton(
                label: Center(
              child: Text(
                'Checkout',
                style: GoogleFonts.itim(
                    textStyle: TextStyle(color: Colors.white, fontSize: 25)),
              ),
            ))
          ])),
    );
  }
}

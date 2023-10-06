import 'dart:developer';
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stepout/businesslogic/wishlist_controller.dart';
import 'package:stepout/presentation/constants/constants.dart';
import 'package:stepout/presentation/constants/combonents/constant_main_container.dart';
import 'package:stepout/presentation/functions/dbfns/db_functions.dart';

final List<String> imgUrl = [
  'lib/presentation/images/shoesONE.png',
  'lib/presentation/images/soesTWO.png',
  'lib/presentation/images/shoesTHREE.png',
  'lib/presentation/images/shoesTHREE.png',
  'lib/presentation/images/soesTWO.png',
  'lib/presentation/images/shoesTHREE.png',
  'lib/presentation/images/shoesTHREE.png',
  'lib/presentation/images/shoesTHREE.png',
  'lib/presentation/images/soesTWO.png',
  'lib/presentation/images/shoesTHREE.png',
];

class FavPage extends StatelessWidget {
  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final wishlist = context.read<WishlistController>();
    // log(wishlist.wishList.length.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const StepOutImg(),
        title: Text(
          'Favorites',
          style: GoogleFonts.itim(textStyle: TextStyle(fontSize: 25)),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('users').doc(currentEmail)
          .collection('wish_list').snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Text('loading');
            }
            return MasonryGridView.builder(
              padding: EdgeInsets.all(20),
              mainAxisSpacing: 10,
              crossAxisSpacing: 15,
              shrinkWrap: true,
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: imgUrl.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: MainContainer(
                        padding: EdgeInsets.all(5),
                        height: MediaQuery.of(context).size.width * 0.34,
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const Align(
                                alignment: Alignment.topRight,
                                child: CircleAvatar(
                                  radius: 15,
                                  child: Icon(
                                    Icons.favorite,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Image.asset(imgUrl[index]),
                            )
                          ],
                        ),
                      ),
                    ),
                    kheight10,
                    Text(
                      'Asics Gel Contend 7',
                      style: GoogleFonts.itim(
                          textStyle: const TextStyle(
                              fontSize: 17, color: Colors.black)),
                    ),
                    Text(
                      'MRP :',
                      style: GoogleFonts.itim(
                          textStyle: const TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 127, 127, 127))),
                    ),
                    Text(
                      '₹ 14,995',
                      style: GoogleFonts.itim(
                          textStyle: const TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 127, 127, 127))),
                    )
                  ],
                );
              },
            );
          }),
    );
  }
}

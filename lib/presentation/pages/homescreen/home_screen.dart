import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/presentation/constants/constants.dart';
import 'package:stepout/presentation/constants/combonents/constant_main_container.dart';
import 'package:stepout/presentation/functions/auth_fns.dart';
import 'package:stepout/presentation/pages/cartpage/cart_page.dart';
import 'package:stepout/presentation/pages/productdetails/product_details.dart';
import 'package:stepout/presentation/pages/settings/settings.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  late Stream<QuerySnapshot> productName;
  final productFirestore =
      FirebaseFirestore.instance.collection('product_list');
  final AuthFn authFn = AuthFn();
  @override
  Widget build(BuildContext context) {
    productName = productFirestore.snapshots();
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
                    builder: (context) => const SettingsPage(),
                  ));
                },
                icon: const Icon(
                  Icons.settings,
                  color: Colors.black,
                )),
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: productName,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Something Went Wrong',
                    style: GoogleFonts.itim(
                        textStyle:
                            const TextStyle(fontSize: 30, color: Colors.black)),
                  ),
                );
              } else {
                QuerySnapshot querySnapshot = snapshot.data;
                List<QueryDocumentSnapshot> document = querySnapshot.docs;
                List<Map> items = document
                    .map((e) => {
                          'name': e['name'],
                          'image': e['image'],
                          'amount': e['amount'],
                          // 'size': e['size'],
                          'description': e['description'],
                          // 'brandlist': e['brandlist']
                        })
                    .toList();
                if (querySnapshot.docs.isEmpty) {
                  return Center(
                    child: Text(
                      'Sorry Product not Available',
                      style: GoogleFonts.itim(
                          textStyle: const TextStyle(
                              fontSize: 30, color: Colors.black)),
                    ),
                  );
                }
                return Padding(
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
                              textStyle: const TextStyle(
                                  fontSize: 25, color: Colors.black)),
                        ),
                        kheight20,
                        SizedBox(
                          height: size * 0.7,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MainContainer(
                                        padding: const EdgeInsets.all(5),
                                        height: size * 0.5,
                                        width: size * 0.4,
                                        child:
                                            Image.network(items[index]['image'],
                                                loadingBuilder: (context, child,
                                                    loadingProgress) {
                                          if (loadingProgress == null)
                                            return child;

                                          return Center(
                                            child: CircularProgressIndicator(
                                              value: loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!
                                                  : null,
                                            ),
                                          );
                                        }
                                                // fit: BoxFit.cover,
                                                ),
                                      ),
                                      kheight10,
                                      SizedBox(
                                        width: size * 0.4,
                                        child: Text(
                                          items[index]['name'],
                                          style: GoogleFonts.itim(
                                              textStyle:
                                                  TextStyle(fontSize: 16)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Text(
                          'Retro Running',
                          style: GoogleFonts.itim(
                              textStyle: const TextStyle(
                                  fontSize: 25, color: Colors.black)),
                        ),
                        kheight20,
                        Flexible(
                          child: MasonryGridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 15,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              final productName = items[index]['name'];
                              final description = items[index]['description'];
                              final amount = items[index]['amount'];
                              final imageUrl = items[index]['image'];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => ProductDetails(
                                          productName: productName,
                                          amount: amount,
                                          description: description,
                                          imgURL: imageUrl,
                                        ),
                                      ));
                                    },
                                    child: MainContainer(
                                      padding: EdgeInsets.all(5),
                                      height: size * 0.34,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: InkWell(
                                              onTap: () {},
                                              child: const CircleAvatar(
                                                radius: 15,
                                                child: Icon(
                                                  Icons.favorite_outline,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Image.network(
                                                items[index]['image'],
                                                loadingBuilder: (context, child,
                                                    loadingProgress) {
                                              if (loadingProgress == null)
                                                return child;

                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
                                                      ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          loadingProgress
                                                              .expectedTotalBytes!
                                                      : null,
                                                ),
                                              );
                                            }
                                                // fit: BoxFit.cover,
                                                ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  kheight10,
                                  Text(
                                    items[index]['name'],
                                    style: GoogleFonts.itim(
                                        textStyle: const TextStyle(
                                            fontSize: 17, color: Colors.black)),
                                  ),
                                  Text(
                                    'MRP :',
                                    style: GoogleFonts.itim(
                                        textStyle: const TextStyle(
                                            fontSize: 17,
                                            color: Color.fromARGB(
                                                255, 127, 127, 127))),
                                  ),
                                  Text(
                                    '₹ ${items[index]['amount']}',
                                    style: GoogleFonts.itim(
                                        textStyle: const TextStyle(
                                            fontSize: 17,
                                            color: Color.fromARGB(
                                                255, 127, 127, 127))),
                                  )
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    )),
                  ),
                );
              }
            }));
  }
}

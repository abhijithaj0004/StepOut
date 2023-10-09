import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/presentation/core/constants.dart';
import 'package:stepout/presentation/core/combonents/constant_main_container.dart';
import 'package:stepout/presentation/functions/auth_fns.dart';
import 'package:stepout/presentation/screens/cartpage/cart_page.dart';
import 'package:stepout/presentation/screens/productdetails/product_details.dart';
import 'package:stepout/presentation/screens/searchpage/search_page.dart';
import 'package:stepout/presentation/screens/settings/settings.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

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
            textStyle: const TextStyle(fontSize: 30, color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SearchPage(),
              ));
            },
            icon: const Icon(
              Icons.search,
              size: 30,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () async {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CartPage(),
              ));
            },
            icon: const FaIcon(
              FontAwesomeIcons.bagShopping,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () async {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SettingsPage(),
              ));
            },
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ),
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
                  textStyle: const TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
            );
          } else {
            QuerySnapshot querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot> document = querySnapshot.docs;
            List<Map<String, dynamic>> items = document.map((e) {
              final dynamic amount = e['amount'];
              final double doubleAmount = amount is int
                  ? (amount.toDouble()) // Convert int to double if needed
                  : amount.toDouble(); // Keep it as is if already double

              return {
                'name': e['name'],
                'image': e['image'],
                'amount': doubleAmount,
                'size': List<String>.from(e['size']),
                'description': e['description'],
                'categoryList': e['categoryList']
              };
            }).toList();

            if (querySnapshot.docs.isEmpty) {
              return Center(
                child: Text(
                  'Sorry Product not Available',
                  style: GoogleFonts.itim(
                    textStyle:
                        const TextStyle(fontSize: 30, color: Colors.black),
                  ),
                ),
              );
            }

            // Get unique categories from items
            List<String> uniqueCategories = getUniqueCategories(items);

            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Loop through unique categories and create sections
                      for (String category in uniqueCategories)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              category,
                              style: GoogleFonts.itim(
                                textStyle: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            kheight20,
                            // Create a list of products for this category
                            SizedBox(
                              height: size * 0.7,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: items.length,
                                itemBuilder: (context, index) {
                                  if (items[index]['categoryList'] ==
                                      category) {
                                    final String productName =
                                        items[index]['name'];
                                    final String description =
                                        items[index]['description'];
                                    final double amount =
                                        items[index]['amount'];
                                    final String imageUrl =
                                        items[index]['image'];
                                    final List<String> productSize =
                                        items[index]['size'];

                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 20.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProductDetails(
                                                      productName: productName,
                                                      amount: amount,
                                                      description: description,
                                                      imgURL: imageUrl,
                                                      productSize: productSize,
                                                      productid:
                                                          document[index].id,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: MainContainer(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                height: size * 0.5,
                                                width: size * 0.4,
                                                child: Image.network(
                                                  imageUrl,
                                                  loadingBuilder: (context,
                                                      child, loadingProgress) {
                                                    if (loadingProgress ==
                                                        null) {
                                                      return child;
                                                    }
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
                                                  },
                                                ),
                                              ),
                                            ),
                                            kheight10,
                                            SizedBox(
                                              width: size * 0.4,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    productName,
                                                    style: GoogleFonts.itim(
                                                      textStyle: TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                  Text('MRP:',
                                                      style: GoogleFonts.itim(
                                                        textStyle: TextStyle(
                                                            fontSize: 16,
                                                            color: const Color
                                                                .fromARGB(255,
                                                                99, 99, 99)),
                                                      )),
                                                  Text(amount.toString(),
                                                      style: GoogleFonts.itim(
                                                        textStyle: TextStyle(
                                                            fontSize: 16,
                                                            color: const Color
                                                                .fromARGB(255,
                                                                99, 99, 99)),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  } else {
                                    // Return an empty container if the product doesn't belong to this category
                                    return Container();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  List<String> getUniqueCategories(List<Map<String, dynamic>> items) {
    final Set<String> uniqueCategories = {};
    for (var item in items) {
      uniqueCategories.add(item['categoryList']);
    }
    return uniqueCategories.toList();
  }
}

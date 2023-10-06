import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/presentation/functions/auth_fns.dart';
import 'package:stepout/presentation/pages/cartpage/cart_page.dart';
import 'package:stepout/presentation/pages/homescreen/widgets/product_listtile.dart';
import 'package:stepout/presentation/pages/searchpage/search_page.dart';
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
                'categoryList': e['categoryList'], // Add category field
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

            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var category in getUniqueCategories(items))
                        CategorySection(
                          documentId: document,
                          categoryName: category,
                          items: items
                              .where((item) => item['categoryList'] == category)
                              .toList(),
                          size: size,
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

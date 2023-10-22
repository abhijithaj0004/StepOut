import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/businesslogic/search/search_product_cubit.dart';
import 'package:stepout/presentation/screens/productdetails/product_details.dart';
import 'package:stepout/presentation/screens/searchpage/widgets/before_search.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  late Stream<QuerySnapshot> productName;
  final productFirestore =
      FirebaseFirestore.instance.collection('product_list');
  final searchController = TextEditingController();
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
          'Search',
          style: GoogleFonts.itim(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Builder(builder: (context) {
          return Column(
            children: [
              TextField(
                controller: searchController,
                onChanged: (value) {
                  context.read<SearchProductCubit>().search(value);
                },
                decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    hintStyle: GoogleFonts.itim(
                        textStyle: const TextStyle(fontSize: 20)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
              BlocBuilder<SearchProductCubit, SearchProductState>(
                builder: (context, state) {
                  return StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('product_list')
                          .orderBy('name_lowercase')
                          .startAt([state.searchedName.toLowerCase()]).endAt([
                        // ignore: prefer_interpolation_to_compose_strings
                        state.searchedName.toLowerCase() + '\uf8ff'
                      ]).snapshots(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasError) {
                          return const Center(
                            child: Text('Something Went wrong'),
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          QuerySnapshot querySnapshot = snapshot.data;
                          List<QueryDocumentSnapshot> document =
                              querySnapshot.docs;
                          List<Map<String, dynamic>> items = document.map((e) {
                            final dynamic amount = e['amount'];
                            final double doubleAmount = amount is int
                                ? (amount
                                    .toDouble()) // Convert int to double if needed
                                : amount
                                    .toDouble(); // Keep it as is if already double

                            return {
                              'name': e['name'],
                              'image': e['image'],
                              'amount': doubleAmount,
                              'size': List<String>.from(e['size']),
                              'description': e['description'],
                              'categoryList':
                                  e['categoryList'], // Add category field
                            };
                          }).toList();
                          // if (items.isEmpty) {
                          //   Center(child: Text('No Products'));
                          // }
                          return Expanded(
                            child: Column(
                              children: [
                                items.isNotEmpty
                                    ? Expanded(
                                        child: ListView.builder(
                                          itemCount: items.length,
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProductDetails(
                                                    categoryList: items[index]
                                                        ['categoryList'],
                                                    productName: items[index]
                                                        ['name'],
                                                    imgURL: items[index]
                                                        ['image'],
                                                    description: items[index]
                                                        ['description'],
                                                    amount: items[index]
                                                        ['amount'],
                                                    productSize: items[index]
                                                        ['size'],
                                                    productid:
                                                        document[index].id,
                                                  ),
                                                ));
                                              },
                                              child: SearchList(
                                                  items: items,
                                                  size: size,
                                                  index: index),
                                            );
                                          },
                                        ),
                                      )
                                    : Center(
                                        child: Text(
                                          'No Products Found',
                                          style: GoogleFonts.itim(
                                              textStyle: const TextStyle(
                                                  fontSize: 20)),
                                        ),
                                      )
                              ],
                            ),
                          );
                        }
                      });
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}

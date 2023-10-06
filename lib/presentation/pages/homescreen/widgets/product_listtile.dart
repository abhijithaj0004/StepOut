import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/businesslogic/wishlist/wish_list_cubit.dart';
import 'package:stepout/presentation/constants/combonents/constant_main_container.dart';
import 'package:stepout/presentation/constants/constants.dart';
import 'package:stepout/presentation/functions/dbfns/db_functions.dart';
import 'package:stepout/presentation/pages/productdetails/product_details.dart';

class CategorySection extends StatelessWidget {
  final String categoryName;
  final List<Map<String, dynamic>> items;
  final double size;
  final List<QueryDocumentSnapshot<Object?>> documentId;

  const CategorySection(
      {super.key,
      required this.categoryName,
      required this.items,
      required this.size,
      required this.documentId});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          categoryName,
          style: GoogleFonts.itim(
            textStyle: const TextStyle(
              fontSize: 25,
              color: Colors.black,
            ),
          ),
        ),
        kheight20,
        MasonryGridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 10,
          crossAxisSpacing: 15,
          shrinkWrap: true,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final String productName = items[index]['name'];
            final String description = items[index]['description'];
            final double amount = items[index]['amount'];
            final String imageUrl = items[index]['image'];
            final List<String> productSize = items[index]['size'];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductDetails(
                          productName: productName,
                          amount: amount,
                          description: description,
                          imgURL: imageUrl,
                          productSize: productSize,
                        ),
                      ),
                    );
                  },
                  child: MainContainer(
                    padding: EdgeInsets.all(5),
                    height: size * 0.34,
                    child: BlocBuilder<WishListCubit, WishListState>(
                      builder: (context, state) {
                        return Stack(
                          children: [
                            Center(
                              child: Image.network(
                                imageUrl,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
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
                            Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () {
                                  // DbFunctions().addProductstoFav(
                                  //     documentId[index].id, context);
                                  // context.read<WishListCubit>().addToFav();
                                },
                                child: CircleAvatar(
                                  radius: 15,
                                  child: Icon(
                                    !state.isFav
                                        ? Icons.favorite_outline
                                        : Icons.favorite,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                kheight10,
                Text(
                  productName,
                  style: GoogleFonts.itim(
                    textStyle: const TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  'MRP :',
                  style: GoogleFonts.itim(
                    textStyle: const TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 127, 127, 127),
                    ),
                  ),
                ),
                Text(
                  '₹ $amount',
                  style: GoogleFonts.itim(
                    textStyle: const TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 127, 127, 127),
                    ),
                  ),
                ),
                kheight20,
              ],
            );
          },
        ),
      ],
    );
  }
}

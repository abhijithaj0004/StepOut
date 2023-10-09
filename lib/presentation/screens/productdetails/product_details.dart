import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/businesslogic/productdetails/productdetail_cubit.dart';
import 'package:stepout/businesslogic/wishlist/wish_list_cubit.dart';
import 'package:stepout/presentation/core/combonents/constant_button.dart';
import 'package:stepout/presentation/core/combonents/constant_main_container.dart';
import 'package:stepout/presentation/core/constants.dart';
import 'package:stepout/presentation/screens/cartpage/cart_page.dart';
import 'package:stepout/services/wish_list_service.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails(
      {super.key,
      required this.productName,
      required this.imgURL,
      required this.description,
      required this.amount,
      required this.productSize,
      required this.productid});
  final String productName;
  final String imgURL;
  final String description;
  final double amount;
  final List<String> productSize;
  final String productid;

  @override
  Widget build(BuildContext context) {
    // WishListModel wishListModel;

    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          productName,
          style: GoogleFonts.itim(textStyle: const TextStyle(fontSize: 23)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: BlocBuilder<ProductdetailCubit, ProductdetailState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainContainer(
                    width: double.infinity,
                    height: size * 0.7,
                    padding: const EdgeInsets.all(10),
                    child: Image.network(imgURL,
                        loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;

                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    }
                        // fit: BoxFit.cover,
                        ),
                  ),
                  kheight30,
                  Text(
                    "Men's Shoes",
                    style: GoogleFonts.itim(
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                  ),
                  kheight10,
                  Text(
                    productName,
                    style: GoogleFonts.itim(
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  kheight10,
                  Text(
                    "MRP : ₹ $amount",
                    style: GoogleFonts.itim(
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                  ),
                  Text(
                    "Incl. of taxes",
                    style: GoogleFonts.itim(
                      textStyle:
                          const TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ),
                  kheight10,
                  Text(
                    description,
                    style: GoogleFonts.itim(
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                  ),
                  kheight20,
                  SizedBox(
                    height: size * 0.14,
                    child: ListView.builder(
                      itemCount: productSize.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                context
                                    .read<ProductdetailCubit>()
                                    .toggleColor(index);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: state.selectedndex == index
                                        ? const Color.fromARGB(
                                            255, 162, 162, 162)
                                        : const Color.fromARGB(
                                            255, 227, 227, 227)),
                                child: Center(
                                  child: Text(
                                    productSize[index],
                                    style: GoogleFonts.itim(
                                        textStyle:
                                            const TextStyle(fontSize: 20)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  kheight30,
                  BlocBuilder<WishListCubit, WishListState>(
                    builder: (context, state) {
                      return InkWell(
                        onTap: () {
                          if (state.wishList.contains(productid)) {
                            log('from screen $productid');
                            context
                                .read<WishListCubit>()
                                .remove(productid, context);
                            debugPrint(productid);
                          } else {
                            WishListService().addProductstoFav(
                                productid,
                                productName,
                                description,
                                amount,
                                imgURL,
                                productSize,
                                context);
                          }
                          context.read<WishListCubit>().getWishList();
                          // log(wishlistmodel.name);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Favorite',
                                style: GoogleFonts.itim(
                                  textStyle: const TextStyle(fontSize: 23),
                                ),
                              ),
                              kWidth10,
                              Icon(state.wishList.contains(productid)
                                  ? Icons.favorite
                                  : Icons.favorite_outline),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  kheight20,
                  KButton(
                    onClick: () {
                      // DbFunctions().addProductsToCart(productid, context);
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            'Added to Bag',
                            style: GoogleFonts.itim(
                              textStyle: const TextStyle(fontSize: 23),
                            ),
                          ),
                          content: Text(
                            'Your product is added to Bag',
                            style: GoogleFonts.itim(
                              textStyle: const TextStyle(fontSize: 18),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) => const CartPage(),
                                ));
                              },
                              child: Text(
                                'CHECKOUT',
                                style: GoogleFonts.itim(
                                  textStyle: const TextStyle(),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'OK',
                                style: GoogleFonts.itim(
                                  textStyle: const TextStyle(),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    label: Center(
                      child: Text(
                        'Add to Bag',
                        style: GoogleFonts.itim(
                            textStyle: const TextStyle(fontSize: 20),
                            color: Colors.white),
                      ),
                    ),
                  ),
                  kheight20,
                  Text(
                    'This product is excluded from all promotions and discounts.',
                    style: GoogleFonts.itim(
                      textStyle:
                          const TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

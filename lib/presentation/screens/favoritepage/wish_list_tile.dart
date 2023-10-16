import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/businesslogic/wishlist/wish_list_cubit.dart';
import 'package:stepout/presentation/core/combonents/constant_main_container.dart';
import 'package:stepout/presentation/core/constants.dart';
import 'package:stepout/presentation/screens/productdetails/product_details.dart';

class WishtileList extends StatelessWidget {
  const WishtileList({
    super.key,
    // required this.productId,
    // required this.index,
  });
  // final int index;
  // final String productId;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc('${FirebaseAuth.instance.currentUser!.email}')
            .collection('wish_list')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Something wrong'),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('Wishlist is Empty'),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return MasonryGridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(20),
            mainAxisSpacing: 10,
            crossAxisSpacing: 15,
            shrinkWrap: true,
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return ItemCard(
                categoryList: snapshot.data!.docs[index]['categoryList'],
                imagepath: snapshot.data!.docs[index]['image'],
                name: snapshot.data!.docs[index]['name'],
                amount: snapshot.data!.docs[index]['amount'],
                productId: snapshot.data!.docs[index].id,
                size: List<String>.from(snapshot.data!.docs[index]['size']),
                description: snapshot.data!.docs[index]['description'],
              );

              // return WishtileList(productId: state.wishList[index],);
            },
          );
        });
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.productId,
    required this.name,
    required this.imagepath,
    required this.amount,
    required this.size,
    required this.description,
    required this.categoryList
  });
  final String productId;
  final String name;
  final String imagepath;
  final List<String> size;
  final double amount;
  final String description;
  final String categoryList;
  @override
  Widget build(BuildContext context) {
    final toggleFav = context.read<WishListCubit>().state.wishList;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetails(
                  categoryList: categoryList,
                  productName: name,
                  imgURL: imagepath,
                  description: description,
                  amount: amount,
                  productSize: size,
                  productid: productId),
            ));
          },
          child: MainContainer(
            padding: const EdgeInsets.all(5),
            height: MediaQuery.of(context).size.width * 0.34,
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    context.read<WishListCubit>().remove(productId, context);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Product removed from favorite')));
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      radius: 15,
                      child: Icon(
                        toggleFav.contains(productId)
                            ? Icons.favorite
                            : Icons.favorite_outlined,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Image.network(imagepath),
                )
              ],
            ),
          ),
        ),
        kheight10,
        Text(
          name,
          style: GoogleFonts.itim(
              textStyle: const TextStyle(fontSize: 17, color: Colors.black)),
        ),
        Text(
          'MRP :',
          style: GoogleFonts.itim(
              textStyle: const TextStyle(
                  fontSize: 17, color: Color.fromARGB(255, 127, 127, 127))),
        ),
        Text(
          '₹ $amount',
          style: GoogleFonts.itim(
              textStyle: const TextStyle(
                  fontSize: 17, color: Color.fromARGB(255, 127, 127, 127))),
        )
      ],
    );
  }
}

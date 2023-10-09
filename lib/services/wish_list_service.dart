import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WishListService {
  Future<void> addProductstoFav(
      String id,
      String name,
      String description,
      double amount,
      String image,
      List<String> size,
      BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc('${FirebaseAuth.instance.currentUser!.email}')
          .collection('wish_list')
          .doc(id)
          .set({
        'product_id': id,
        'name': name,
        'image': image,
        'amount': amount,
        'size': size,
        'description': description,
        // 'categoryList': e['categoryList']
      }).then(
        (value) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Product Successfully added to cart')));
        },
      );
    } catch (e) {
      log(e.toString());
    }
  }

  deleteProductFromFav(String id, BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc('${FirebaseAuth.instance.currentUser!.email}')
          .collection('wish_list')
          .doc(id)
          .delete()
          .then(
        (value) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Product successfully removed from favorite')));
        },
      );
    } catch (e) {
      log(e.toString());
    }
  }

  //  addProductsToCart(String id, BuildContext context) async {
  //   try {
  //     Map<String, dynamic> datatoAdd = {
  //       'product_id': id,
  //     };
  //     await cartListStore.add(datatoAdd).then((value) => {
  //           ScaffoldMessenger.of(context).showSnackBar(
  //               SnackBar(content: Text('Product Successfully added to cart'))),
  //         });
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
}

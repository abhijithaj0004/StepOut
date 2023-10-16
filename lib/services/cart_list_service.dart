import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CartListService {
  Future<void> addProductstoCart(
      String id,
      String name,
      String description,
      double amount,
      String image,
      String categoryList,
      String size,
      
      List<String>sizeList,
      int quantity,
      BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc('${FirebaseAuth.instance.currentUser!.email}')
          .collection('cart_list')
          .doc(id)
          .set({
        'product_id': id,
        'name': name,
        'image': image,
        'amount': amount,
        'size': size,
        'size_list':sizeList,
        'description': description,
        'categoryList': categoryList,
        'quantity':quantity
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

  removefromcart(String id, BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc('${FirebaseAuth.instance.currentUser!.email}')
          .collection('cart_list')
          .doc(id)
          .delete()
          .then(
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
}

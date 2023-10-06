import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final currentEmail = FirebaseAuth.instance.currentUser!.email;

class DbFunctions {
  final wishListStore = FirebaseFirestore.instance
      .collection('users')
      .doc('${currentEmail}')
      .collection('wish_list');
  addProductstoFav(String id, BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentEmail)
          .collection('wish_list')
          .doc(id)
          .set({'productid': id}).then((value) => {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Product Successfully added to Favorite'))),
              });
    } catch (e) {
      log(e.toString());
    }
  }

  getProductforFav(String id) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentEmail)
          .collection('wish_list')
          .doc(id)
          .get();
    } catch (e) {
      log(e.toString());
    }
  }

  deleteProductFromFav(String id, BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentEmail)
          .collection('wish_list')
          .doc(id)
          .delete()
          .then((value) => {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        Text('Product successfully removed from favorite')))
              });
    } catch (e) {
      log(e.toString());
    }
  }
}

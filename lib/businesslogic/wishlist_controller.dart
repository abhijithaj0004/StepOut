import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stepout/presentation/functions/dbfns/db_functions.dart';

class WishlistController extends ChangeNotifier {
  List<String> wishList = [];
  add(String productId) {
    wishList.add(productId);
    notifyListeners();
  }

  remove(String productId) {
    wishList.remove(productId);
    notifyListeners();
  }

  getWishList() async {
    wishList = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentEmail)
        .collection('wish_list')
        .get()
        .then((value) => value.docs.map((e) => e.id).toList());
    notifyListeners();
  }
}

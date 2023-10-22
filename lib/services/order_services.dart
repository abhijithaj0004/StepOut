import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OrderServices {
  Future<void> addProductstoCheckout(
      String id,
      String firstName,
      String secondName,
      String address1,
      String address2,
      String postalCode,
      String stateTerritory,
      String email,
      String phoneNumber,
      double totalAmount,
      bool isSuccess,
      List<Map<String, dynamic>> products,
      
      BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc('${FirebaseAuth.instance.currentUser!.email}')
          .collection('order_list')
          .doc(id)
          .set({
        'first_name': firstName,
        'last_name': secondName,
        'address1': address1,
        'address2': address2,
        'postalCode': postalCode,
        'state_territory': stateTerritory,
        'email': email,
        'phoneNumber': phoneNumber,
        'total_amount': totalAmount,
        'products': products,
        'isSuccess':isSuccess,
      }).then(
        (value) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Order Details Completed')));
        },
      );
    } catch (e) {
      // log(e.toString());
      log(e.toString());
    }
  }
//     String generateOrderID() {
//   final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
//   final String random = Random().nextInt(10000).toString();
//   return '$timestamp-$random';
// }
}

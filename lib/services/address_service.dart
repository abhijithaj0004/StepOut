import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddressService {
  Future<void> addAddress(
      String firstName,
      String secondName,
      String address1,
      String address2,
      String postalCode,
      String stateTerritory,
      String email,
      String phoneNumber,
      BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc('${FirebaseAuth.instance.currentUser!.email}')
          .collection('address')
          .doc()
          .set({
        'first_name': firstName,
        'last_name': secondName,
        'address1': address1,
        'address2': address2,
        'postalCode': postalCode,
        'state_territory': stateTerritory,
        'email': email,
        'phoneNumber': phoneNumber,
      }).then(
        (value) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Address Successfully created')));
        },
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> deleteAddress(id, BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc('${FirebaseAuth.instance.currentUser!.email}')
          .collection('address')
          .doc(id)
          .delete()
          .then((value) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Address removed')));
      });
    } catch (e) {
      log(e.toString());
    }
  }
}

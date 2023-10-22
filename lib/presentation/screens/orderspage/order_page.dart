import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/presentation/core/combonents/constant_main_container.dart';
import 'package:stepout/presentation/core/constants.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Purchases',
          style: GoogleFonts.itim(),
        ),
        leading: const StepOutImg(),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.email)
              .collection('order_list')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Something went wrong'),
              );
            } else {}
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return MainContainer(
                    child: Row(
                      children: [
                        SizedBox(
                          height: 150,
                          child: Image.network(
                            snapshot.data!.docs[index]['products'][index]
                                ['image'],
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: snapshot.data!.docs.length,
              ),
            );
          }),
    );
  }
}

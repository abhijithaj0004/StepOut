import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:stepout/presentation/core/constants.dart';
import 'package:stepout/presentation/screens/addaddress/add_address.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage(
      {super.key,
      required this.totalAmount,
      required this.productId,
      required this.items});
  final Razorpay razorpay = Razorpay();
  final double totalAmount;
  final String productId;
  final int items;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const StepOutImg())),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc('${FirebaseAuth.instance.currentUser!.email}')
                    .collection('order_list')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Something went wrong'),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Column(
                      children: [
                        SummaryTopWidget(
                          items: items,
                          totalAmount: totalAmount,
                        ),
                        kheight20,
                        InkWell(
                          onTap: () {
                            // log(productId);
                            for (var element in snapshot.data!.docs) {
                              final options = {
                                'key': 'rzp_test_XYzcf9j0EwED7s',
                                'amount': element['total_amount'] * 100,
                                'name': element['first_name'] +
                                    ' ' +
                                    element['last_name'],
                                // 'order_id': element
                                //     .id, // Generate order_id using Orders API
                                'description': 'StepOut',
                                'timeout': 60, // in seconds
                                'prefill': {
                                  'contact': element['phoneNumber'],
                                  'email': element['email']
                                }
                              };
                              razorpay.open(options);
                              payment();
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ListTile(
                              leading: const Icon(Icons.payment),
                              title: Text(
                                'Click to Pay',
                                style: GoogleFonts.itim(
                                    textStyle: const TextStyle(
                                        fontSize: 21,
                                        color:
                                            Color.fromARGB(255, 36, 35, 35))),
                              ),
                              trailing: const CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 54, 244, 79),
                                radius: 5,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        // KButton(
                        //     label: Center(
                        //   child: Text(
                        //     'Pay',
                        //     style: GoogleFonts.itim(
                        //         textStyle: const TextStyle(
                        //             fontSize: 22,
                        //             color: Color.fromARGB(255, 255, 255, 255))),
                        //   ),
                        // ))
                      ],
                    );
                  }
                })),
      ),
    );
  }

  payment() {
    razorpay.clear(); // Removes all listeners

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }
  // String generateOrderID() {
  //   // You can use a combination of timestamp and a random number to create a unique order ID.
  //   // For example, you can use the current timestamp and a random integer.
  //   final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  //   final String random = Random().nextInt(10000).toString();
  //   return '$timestamp-$random';
  // }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    const bool isSuccess = true;
    // Do something when payment succeeds
    String? paymentId = response.paymentId;
    String? orderId = response.orderId; // Get the order ID
    String? signature = response.signature;
    print(paymentId.toString());
    print(orderId.toString());
    print(signature.toString());

    // Navigator.of(context).pushAndRemoveUntil(
    //   MaterialPageRoute(
    //     builder: (context) => MainPage(),
    //   ),
    //   (route) => false,
    // );
    updateFirestoreDocument(isSuccess, productId);
  }

  Future<void> updateFirestoreDocument(bool isSuccess, String id) async {
    // Get a reference to the Firestore document you want to update
    // DocumentReference documentReference = FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(FirebaseAuth.instance.currentUser!.email)
    //     .collection('order_list')
    //     .doc();

    // // Define the data to update
    // Map<String, dynamic> data = {
    //   'isSuccess': isSuccess,
    //   // Add other fields as needed
    // };

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection('order_list')
          .doc(id)
          .update({'isSuccess': isSuccess});
      log('Document updated successfully');
    } catch (error) {
      log('Error updating document: $error');
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }
}

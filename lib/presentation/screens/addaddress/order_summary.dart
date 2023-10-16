import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/presentation/core/combonents/constant_button.dart';
import 'package:stepout/presentation/core/constants.dart';
import 'package:stepout/presentation/screens/addaddress/add_address.dart';
import 'package:stepout/presentation/screens/addaddress/payment_page.dart';
import 'package:stepout/services/address_service.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key, required this.totalAmount});
  final double totalAmount;
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
                .collection('address')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Something went wrong'),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SummaryTopWidget(
                      totalAmount: totalAmount,
                    ),
                    kheight30,
                    Text(
                      'When would you like to get your order?',
                      style: GoogleFonts.itim(
                          textStyle: const TextStyle(
                              fontSize: 24,
                              color: Color.fromARGB(255, 36, 35, 35))),
                    ),
                    kheight20,
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              'Arrives Mon, 11 Sept - Wed, 27 Sept',
                              style: GoogleFonts.itim(
                                  textStyle: const TextStyle(
                                      fontSize: 21,
                                      color: Color.fromARGB(255, 36, 35, 35))),
                            ),
                          ),
                          Text(
                            '₹ $totalAmount',
                            style: GoogleFonts.itim(
                                textStyle: const TextStyle(
                                    fontSize: 21,
                                    color: Color.fromARGB(255, 115, 114, 114))),
                          ),
                        ],
                      ),
                    ),
                    kheight20,
                    Center(
                      child: Text(
                        'Arrives Mon, 11 Sept - Wed, 27 Sept',
                        style: GoogleFonts.itim(
                            textStyle: const TextStyle(
                                fontSize: 22,
                                color: Color.fromARGB(255, 112, 112, 112))),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    KButton(
                        onClick: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                PaymentPage(totalAmount: totalAmount),
                          ));
                        },
                        label: Center(
                          child: Text(
                            'Continue',
                            style: GoogleFonts.itim(
                                textStyle: const TextStyle(
                                    fontSize: 22,
                                    color: Color.fromARGB(255, 255, 255, 255))),
                          ),
                        )),
                    kheight20,
                    const Divider(
                      thickness: 2,
                    ),
                    kheight20,
                    Text(
                      'Delivery',
                      style: GoogleFonts.itim(
                          textStyle: const TextStyle(
                              fontSize: 22,
                              color: Color.fromARGB(255, 140, 137, 137))),
                    ),
                    kheight20,
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('users')
                            .doc('${FirebaseAuth.instance.currentUser!.email}')
                            .collection('address')
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
                          } else if (snapshot.data!.docs.isEmpty) {
                            return Center(
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => AddAdressPage(
                                          totalAmount: totalAmount),
                                    ));
                                  },
                                  child: Text('Add New Address')),
                            );
                          }
                          return SizedBox(
                              height: MediaQuery.of(context).size.width * 0.5,
                              child: ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${snapshot.data!.docs[index]['first_name']} ${snapshot.data!.docs[index]['last_name']}',
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.itim(
                                                  textStyle: const TextStyle(
                                                      fontSize: 18,
                                                      color: Color.fromARGB(
                                                          255, 105, 105, 105))),
                                            ),
                                            Text(
                                              '${snapshot.data!.docs[index]['address1']}',
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.itim(
                                                  textStyle: const TextStyle(
                                                      fontSize: 18,
                                                      color: Color.fromARGB(
                                                          255, 105, 105, 105))),
                                            ),
                                            Text(
                                              '${snapshot.data!.docs[index]['address2']}',
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.itim(
                                                  textStyle: const TextStyle(
                                                      fontSize: 18,
                                                      color: Color.fromARGB(
                                                          255, 105, 105, 105))),
                                            ),
                                            Text(
                                              '${snapshot.data!.docs[index]['email']}',
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.itim(
                                                  textStyle: const TextStyle(
                                                      fontSize: 18,
                                                      color: Color.fromARGB(
                                                          255, 105, 105, 105))),
                                            ),
                                            Text(
                                              '${snapshot.data!.docs[index]['phoneNumber']}',
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.itim(
                                                  textStyle: const TextStyle(
                                                      fontSize: 18,
                                                      color: Color.fromARGB(
                                                          255, 105, 105, 105))),
                                            ),
                                            kheight20,
                                            const Divider(
                                              thickness: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: OutlinedButton(
                                            onPressed: () {
                                              AddressService().deleteAddress(
                                                  snapshot.data!.docs[index].id,
                                                  context);
                                            },
                                            child: Text('Remove Address')),
                                      )
                                    ],
                                  );
                                },
                              ));
                        }),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

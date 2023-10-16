import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/businesslogic/addresscubit/address_cubit.dart';
import 'package:stepout/businesslogic/carttotalamountcubit/cart_total_amount_cubit.dart';
import 'package:stepout/presentation/core/constants.dart';
import 'package:stepout/presentation/core/combonents/constant_button.dart';
import 'package:stepout/presentation/core/combonents/constant_main_container.dart';
import 'package:stepout/presentation/screens/addaddress/add_address.dart';
import 'package:stepout/presentation/screens/addaddress/order_summary.dart';
import 'package:stepout/presentation/screens/productdetails/product_details.dart';
import 'package:stepout/services/cart_list_service.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AddressCubit>().checkIfDocumentsExist();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Bag',
          style: GoogleFonts.itim(textStyle: const TextStyle(fontSize: 25)),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc('${FirebaseAuth.instance.currentUser!.email}')
                  .collection('cart_list')
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
                    child: Text('Cart is Empty'),
                  );
                } else {
                  return SingleChildScrollView(
                    child: Column(children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 1.7,
                        child: ListView.separated(
                          // physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            context
                                .read<CartTotalAmountCubit>()
                                .calculateTotalAmount(snapshot.data!.docs);
                            return Slidable(
                              endActionPane: ActionPane(
                                  motion: StretchMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (context) {
                                        CartListService().removefromcart(
                                            snapshot.data!.docs[index].id,
                                            context);
                                      },
                                      icon: Icons.delete,
                                      backgroundColor:
                                          Color.fromARGB(255, 218, 218, 218),
                                    )
                                  ]),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProductDetails(
                                        productName: snapshot.data!.docs[index]
                                            ['name'],
                                        imgURL: snapshot.data!.docs[index]
                                            ['image'],
                                        description: snapshot.data!.docs[index]
                                            ['description'],
                                        amount: snapshot.data!.docs[index]
                                            ['amount'],
                                        productSize: List<String>.from(snapshot
                                            .data!.docs[index]['size_list']),
                                        productid:
                                            snapshot.data!.docs[index].id,
                                        categoryList: snapshot.data!.docs[index]
                                            ['categoryList']),
                                  ));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        MainContainer(
                                          width: 100,
                                          height: 100,
                                          child: Image.network(snapshot
                                              .data!.docs[index]['image']),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                                child: Text(
                                                  '${snapshot.data!.docs[index]['name']}',
                                                  style: GoogleFonts.itim(
                                                      textStyle: TextStyle(
                                                          fontSize: 20)),
                                                ),
                                              ),
                                              kheight10,
                                              Text(
                                                  '${snapshot.data!.docs[index]['categoryList']}',
                                                  style: GoogleFonts.itim(
                                                      textStyle: TextStyle(
                                                          fontSize: 17,
                                                          color: const Color
                                                              .fromARGB(255,
                                                              114, 113, 113)))),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                                child: Text(
                                                    '${snapshot.data!.docs[index]['name']}',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.itim(
                                                        textStyle: TextStyle(
                                                            fontSize: 17,
                                                            color: const Color
                                                                .fromARGB(
                                                                255,
                                                                114,
                                                                113,
                                                                113)))),
                                              ),
                                              Text(
                                                  'size: ${snapshot.data!.docs[index]['size']}',
                                                  style: GoogleFonts.itim(
                                                      textStyle: TextStyle(
                                                          fontSize: 17,
                                                          color: const Color
                                                              .fromARGB(255,
                                                              114, 113, 113)))),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    kheight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Qty: ${snapshot.data!.docs[index]['quantity']}',
                                              style: GoogleFonts.itim(
                                                textStyle: TextStyle(
                                                  fontSize: 17,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                                'MRP : ${snapshot.data!.docs[index]['amount']}',
                                                style: GoogleFonts.itim(
                                                    textStyle: TextStyle(
                                                  fontSize: 17,
                                                ))),
                                            Text('incl. of taxes',
                                                style: GoogleFonts.itim(
                                                    textStyle: TextStyle(
                                                        fontSize: 16,
                                                        color: const Color
                                                            .fromARGB(255, 114,
                                                            113, 113)))),
                                            Text(
                                                '(Also includes all applicable duties)',
                                                style: GoogleFonts.itim(
                                                    textStyle: TextStyle(
                                                        fontSize: 16,
                                                        color: const Color
                                                            .fromARGB(255, 114,
                                                            113, 113)))),
                                          ],
                                        ),
                                      ],
                                    ),
                                    kheight20
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Divider(
                            thickness: 1,
                          ),
                          itemCount: snapshot.data!.docs.length,
                        ),
                      ),
                      BlocBuilder<CartTotalAmountCubit, CartTotalAmountState>(
                        builder: (context, state) {
                          return SizedBox(
                              height: MediaQuery.of(context).size.width * 0.7,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final estimatedAmount =
                                      state.totalAmount + state.shippingCharge;
                                  return Column(
                                    children: [
                                      Divider(
                                        thickness: 2,
                                      ),
                                      kheight30,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Subtotal',
                                              style: GoogleFonts.itim(
                                                  textStyle: TextStyle(
                                                      fontSize: 17,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              114,
                                                              113,
                                                              113)))),
                                          Text(state.totalAmount.toString(),
                                              style: GoogleFonts.itim(
                                                  textStyle: TextStyle(
                                                      fontSize: 17,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              114,
                                                              113,
                                                              113)))),
                                        ],
                                      ),
                                      kheight10,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Shipping',
                                              style: GoogleFonts.itim(
                                                  textStyle: TextStyle(
                                                      fontSize: 17,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              114,
                                                              113,
                                                              113)))),
                                          Text('${state.shippingCharge}',
                                              style: GoogleFonts.itim(
                                                  textStyle: TextStyle(
                                                      fontSize: 17,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              114,
                                                              113,
                                                              113)))),
                                        ],
                                      ),
                                      kheight10,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Estimated Total',
                                              style: GoogleFonts.itim(
                                                  textStyle: TextStyle(
                                                fontSize: 17,
                                              ))),
                                          Text('$estimatedAmount',
                                              style: GoogleFonts.itim(
                                                  textStyle: TextStyle(
                                                fontSize: 17,
                                              ))),
                                        ],
                                      ),
                                      kheight20,
                                      BlocBuilder<AddressCubit, AddressState>(
                                        builder: (context, state) {
                                          return KButton(
                                              onClick: () async {
                                                context
                                                    .read<AddressCubit>()
                                                    .checkIfDocumentsExist();
                                                // log(state.isDocumentExist
                                                //     .toString());

                                                if (state.isDocumentExist) {
                                                  Navigator.of(context)
                                                      .push(MaterialPageRoute(
                                                    builder: (context) =>
                                                        OrderSummary(totalAmount: estimatedAmount,),
                                                  ));
                                                } else {
                                                  Navigator.of(context)
                                                      .push(MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddAdressPage(totalAmount: estimatedAmount),
                                                  ));
                                                }
                                              },
                                              label: Center(
                                                child: Text(
                                                  'Checkout',
                                                  style: GoogleFonts.itim(
                                                      textStyle: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 25)),
                                                ),
                                              ));
                                        },
                                      )
                                    ],
                                  );
                                },
                                itemCount: 1,
                              ));
                        },
                      )
                    ]),
                  );
                }
              })),
    );
  }
}

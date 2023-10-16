import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/presentation/core/combonents/constant_button.dart';
import 'package:stepout/presentation/core/constants.dart';
import 'package:stepout/presentation/screens/addaddress/order_summary.dart';
import 'package:stepout/services/address_service.dart';

class AddAdressPage extends StatelessWidget {
  AddAdressPage({super.key, required this.totalAmount});
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final adressController = TextEditingController();
  final secondadressController = TextEditingController();
  final postalCodeController = TextEditingController();
  final localiyController = TextEditingController();
  final localityController = TextEditingController();
  final stateorTerritoryController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
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
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SummaryTopWidget(totalAmount: totalAmount),
                kheight20,
                Text(
                  'Enter your name and address:',
                  style: GoogleFonts.itim(
                      textStyle: const TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 36, 35, 35))),
                ),
                kheight30,
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'First Name Required';
                    }
                    return null;
                  },
                  controller: firstnameController,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'First Name',
                    hintStyle: GoogleFonts.itim(
                        textStyle: const TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 140, 140, 140))),
                  ),
                ),
                kheight20,
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Last Name Required';
                    }
                    return null;
                  },
                  controller: lastnameController,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Last Name',
                    hintStyle: GoogleFonts.itim(
                        textStyle: const TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 140, 140, 140))),
                  ),
                ),
                kheight20,
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Address Required';
                    }
                    return null;
                  },
                  controller: adressController,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Address Line 1',
                    hintStyle: GoogleFonts.itim(
                        textStyle: const TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 140, 140, 140))),
                  ),
                ),
                kheight20,
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                  controller: secondadressController,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Address Line 2',
                    hintStyle: GoogleFonts.itim(
                        textStyle: const TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 140, 140, 140))),
                  ),
                ),
                kheight20,
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Postal Code Required';
                    }
                    return null;
                  },
                  controller: postalCodeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Postal code',
                    hintStyle: GoogleFonts.itim(
                        textStyle: const TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 140, 140, 140))),
                  ),
                ),
                kheight20,
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Locality Required';
                    }
                    return null;
                  },
                  controller: localityController,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Locality',
                    hintStyle: GoogleFonts.itim(
                        textStyle: const TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 140, 140, 140))),
                  ),
                ),
                kheight20,
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                  controller: stateorTerritoryController,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'State/Territory',
                    hintStyle: GoogleFonts.itim(
                        textStyle: const TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 140, 140, 140))),
                  ),
                ),
                kheight20,
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 140, 140, 140)),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'India',
                        style: GoogleFonts.itim(
                            textStyle: const TextStyle(
                                fontSize: 22,
                                color: Color.fromARGB(255, 89, 89, 89))),
                      ),
                      const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 54, 244, 79),
                        radius: 5,
                      )
                    ],
                  ),
                ),
                kheight30,
                kWidth20,
                kheight20,
                Text(
                  "What's your Contact Information?",
                  style: GoogleFonts.itim(
                      textStyle: const TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 36, 35, 35))),
                ),
                kheight30,
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email Required';
                    }
                    return null;
                  },
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Enter Email',
                    hintStyle: GoogleFonts.itim(
                        textStyle: const TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 140, 140, 140))),
                  ),
                ),
                kheight20,
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'PhoneNumber Required';
                    }
                    return null;
                  },
                  controller: phoneNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Enter PhoneNumber',
                    hintStyle: GoogleFonts.itim(
                        textStyle: const TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 140, 140, 140))),
                  ),
                ),
                kheight30,
                KButton(
                    onClick: () {
                      if (formKey.currentState!.validate()) {
                        AddressService().addAddress(
                            firstnameController.text.trim(),
                            lastnameController.text.trim(),
                            adressController.text.trim(),
                            secondadressController.text.trim(),
                            postalCodeController.text.trim(),
                            stateorTerritoryController.text.trim(),
                            emailController.text.trim(),
                            phoneNumberController.text.trim(),
                            context);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>  OrderSummary(totalAmount: totalAmount),
                        ));
                      }
                    },
                    label: Center(
                      child: Text(
                        'Continue',
                        style: GoogleFonts.itim(
                            textStyle: const TextStyle(
                                fontSize: 22,
                                color: Color.fromARGB(255, 255, 255, 255))),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SummaryTopWidget extends StatelessWidget {
  const SummaryTopWidget({
    super.key,
    required this.totalAmount,
  });
  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const Divider(
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Summary',
                style: GoogleFonts.itim(
                    textStyle: const TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 36, 35, 35))),
              ),
              Text(
                '₹ $totalAmount (2 items)',
                style: GoogleFonts.itim(
                    textStyle: const TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 36, 35, 35))),
              )
            ],
          ),
          const Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/presentation/core/combonents/constant_button.dart';
import 'package:stepout/presentation/core/constants.dart';
import 'package:stepout/presentation/screens/addaddress/order_summary.dart';

class AddAdressPage extends StatelessWidget {
  AddAdressPage({super.key});
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
              child:const StepOutImg())),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SummaryTopWidget(),
              kheight20,
              Text(
                'Enter your name and address:',
                style: GoogleFonts.itim(
                    textStyle: const TextStyle(
                        fontSize: 22, color: Color.fromARGB(255, 36, 35, 35))),
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
                keyboardType: TextInputType.emailAddress,
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
                keyboardType: TextInputType.emailAddress,
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
                keyboardType: TextInputType.emailAddress,
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
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Email Required';
                //   }
                //   return null;
                // },
                controller: secondadressController,
                keyboardType: TextInputType.emailAddress,
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
                keyboardType: TextInputType.emailAddress,
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
                keyboardType: TextInputType.emailAddress,
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
                keyboardType: TextInputType.emailAddress,
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
                        fontSize: 22, color: Color.fromARGB(255, 36, 35, 35))),
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
                keyboardType: TextInputType.emailAddress,
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
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>const OrderSummary(),
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
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class SummaryTopWidget extends StatelessWidget {
  const SummaryTopWidget({
    super.key,
  });

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
                '₹ 31,233 (2 items)',
                style: GoogleFonts.itim(
                    textStyle: const TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 36, 35, 35))),
              )
            ],
          ),
       const   Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}

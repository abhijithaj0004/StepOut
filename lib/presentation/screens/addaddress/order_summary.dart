import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/presentation/core/combonents/constant_button.dart';
import 'package:stepout/presentation/core/constants.dart';
import 'package:stepout/presentation/screens/addaddress/add_address.dart';
import 'package:stepout/presentation/screens/addaddress/payment_page.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SummaryTopWidget(),
              kheight30,
              Text(
                'When would you like to get your order?',
                style: GoogleFonts.itim(
                    textStyle: const TextStyle(
                        fontSize: 24, color: Color.fromARGB(255, 36, 35, 35))),
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
                      '₹ 32,224.00',
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
                      builder: (context) => PaymentPage(),
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
              Text(
                'Abhijith AJ',
                style: GoogleFonts.itim(
                    textStyle: const TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 105, 105, 105))),
              ),
              Text(
                'Address(H)',
                style: GoogleFonts.itim(
                    textStyle: const TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 105, 105, 105))),
              ),
              Text(
                'email@gmail.com',
                style: GoogleFonts.itim(
                    textStyle: const TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 105, 105, 105))),
              ),
              Text(
                '9876544430',
                style: GoogleFonts.itim(
                    textStyle: const TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 105, 105, 105))),
              ),
              kheight20,
              const Divider(
                thickness: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

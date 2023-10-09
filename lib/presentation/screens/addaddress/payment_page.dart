import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/presentation/core/combonents/constant_button.dart';
import 'package:stepout/presentation/core/constants.dart';
import 'package:stepout/presentation/screens/addaddress/add_address.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

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
          children: [
            SummaryTopWidget(),
            kheight20,
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                leading:const Icon(Icons.payment),
                title: Text(
                  'Click to Pay',
                  style: GoogleFonts.itim(
                      textStyle: const TextStyle(
                          fontSize: 21,
                          color: Color.fromARGB(255, 36, 35, 35))),
                ),
                trailing: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 54, 244, 79),
                  radius: 5,
                ),
              ),
            ),
           const SizedBox(
              height: 100,
            ),
            KButton(
                label: Center(
              child: Text(
                'Pay',
                style: GoogleFonts.itim(
                    textStyle: const TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 255, 255, 255))),
              ),
            ))
          ],
        )),
      ),
    );
  }
}

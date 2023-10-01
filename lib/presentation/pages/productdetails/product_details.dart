import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/presentation/constants/combonents/constant_button.dart';
import 'package:stepout/presentation/constants/combonents/constant_main_container.dart';
import 'package:stepout/presentation/constants/constants.dart';
import 'package:stepout/presentation/pages/cartpage/cart_page.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails(
      {super.key,
      required this.productName,
      required this.imgURL,
      required this.description,
      required this.amount});
  final String productName;
  final String imgURL;
  final String description;
  final String amount;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          productName,
          style: GoogleFonts.itim(textStyle: const TextStyle(fontSize: 23)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainContainer(
                width: double.infinity,
                height: size * 0.7,
                padding: EdgeInsets.all(10),
                child: Image.network(imgURL,
                    loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;

                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                }
                    // fit: BoxFit.cover,
                    ),
              ),
              kheight30,
              Text(
                "Men's Shoes",
                style: GoogleFonts.itim(
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
              kheight10,
              Text(
                productName,
                style: GoogleFonts.itim(
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              kheight10,
              Text(
                "MRP : ₹ $amount",
                style: GoogleFonts.itim(
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
              Text(
                "Incl. of taxes",
                style: GoogleFonts.itim(
                  textStyle: const TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ),
              kheight10,
              Text(
                description,
                style: GoogleFonts.itim(
                  textStyle: const TextStyle(fontSize: 15),
                ),
              ),
              kheight20,
              
              kheight30,
              KButton(
                onClick: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        'Added to Bag',
                        style: GoogleFonts.itim(
                          textStyle: const TextStyle(fontSize: 23),
                        ),
                      ),
                      content: Text(
                        'Your product is added to Bag',
                        style: GoogleFonts.itim(
                          textStyle: const TextStyle(fontSize: 18),
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => CartPage(),
                            ));
                          },
                          child: Text(
                            'CHECKOUT',
                            style: GoogleFonts.itim(
                              textStyle: const TextStyle(),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'OK',
                            style: GoogleFonts.itim(
                              textStyle: const TextStyle(),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
                label: Center(
                  child: Text(
                    'Add to Bag',
                    style: GoogleFonts.itim(
                        textStyle: const TextStyle(fontSize: 20),
                        color: Colors.white),
                  ),
                ),
              ),
              kheight20,
              Text(
                'This product is excluded from all promotions and discounts.',
                style: GoogleFonts.itim(
                  textStyle: const TextStyle(fontSize: 15, color: Colors.grey),
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}

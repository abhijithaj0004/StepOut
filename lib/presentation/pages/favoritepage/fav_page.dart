import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/presentation/constants/constants.dart';
import 'package:stepout/presentation/constants/combonents/constant_main_container.dart';
final List<String> imgUrl = [
    'lib/presentation/images/shoesONE.png',
    'lib/presentation/images/soesTWO.png',
    'lib/presentation/images/shoesTHREE.png'
  ];
class FavPage extends StatelessWidget {
 const FavPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const StepOutImg(),
        title: Text(
          'Favorites',
          style: GoogleFonts.itim(textStyle: TextStyle(fontSize: 25)),
        ),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainContainer(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                            child: Icon(Icons.favorite),
                          ),
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          imgUrl[index],
                          height: 150,
                        ),
                      ),
                    ],
                  ),
                ),
                kheight10,
                Text(
                  'Grand Shark$index',
                  style: GoogleFonts.itim(textStyle: TextStyle(fontSize: 20)),
                ),
                Text(
                  '\$100$index',
                  style: GoogleFonts.itim(textStyle: TextStyle(fontSize: 16)),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

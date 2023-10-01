import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/presentation/constants/constants.dart';
import 'package:stepout/presentation/constants/combonents/constant_main_container.dart';

final List<String> imgUrl = [
  'lib/presentation/images/shoesONE.png',
  'lib/presentation/images/soesTWO.png',
  'lib/presentation/images/shoesTHREE.png',
  'lib/presentation/images/shoesTHREE.png',
  'lib/presentation/images/soesTWO.png',
  'lib/presentation/images/shoesTHREE.png',
  'lib/presentation/images/shoesTHREE.png',
  'lib/presentation/images/shoesTHREE.png',
  'lib/presentation/images/soesTWO.png',
  'lib/presentation/images/shoesTHREE.png',
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
      body: MasonryGridView.builder(
        padding: EdgeInsets.all(20),
        mainAxisSpacing: 10,
        crossAxisSpacing: 15,
        shrinkWrap: true,
        gridDelegate:
            SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: MainContainer(
                  padding: EdgeInsets.all(5),
                  height: MediaQuery.of(context).size.width * 0.34,
                  child: Stack(
                    children: [
                      const Align(
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                          radius: 15,
                          child: Icon(
                            Icons.favorite,
                            size: 20,
                          ),
                        ),
                      ),
                      Center(
                        child: Image.asset(imgUrl[index]),
                      )
                    ],
                  ),
                ),
              ),
              kheight10,
              Text(
                'Asics Gel Contend 7',
                style: GoogleFonts.itim(
                    textStyle:
                        const TextStyle(fontSize: 17, color: Colors.black)),
              ),
              Text(
                'MRP :',
                style: GoogleFonts.itim(
                    textStyle: const TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 127, 127, 127))),
              ),
              Text(
                '₹ 14,995',
                style: GoogleFonts.itim(
                    textStyle: const TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 127, 127, 127))),
              )
            ],
          );
        },
      ),
    );
  }
}

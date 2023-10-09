import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/presentation/core/combonents/constant_main_container.dart';

class SearchList extends StatelessWidget {
  const SearchList({
    super.key,
    required this.items,
    required this.size,
    required this.index,
  });

  final List items;
  final double size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      height: size * 0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(255, 248, 248, 248)),
      child: Row(
        children: [
          MainContainer(
            margin: EdgeInsets.all(20),
            height: size * 0.3,
            child: Image.network(
              items[index]['image'],
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: size * 0.5,
            child: Text(
              items[index]['name'],
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.itim(textStyle: TextStyle(fontSize: 20)),
            ),
          )
        ],
      ),
    );
  }
}

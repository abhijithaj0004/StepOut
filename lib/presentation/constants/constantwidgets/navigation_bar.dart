import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: const Color.fromARGB(255, 148, 148, 148)),
      width: double.infinity,
      height: MediaQuery.of(context).size.width * 0.15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.person_2_outlined),
          Icon(Icons.card_travel),
          // CircleAvatar(
          //   radius: 30,
          //   backgroundColor: Colors.black,
          // ),
          Icon(Icons.favorite_border),
          Icon(Icons.settings),
        ],
      ),
    );
  }
}

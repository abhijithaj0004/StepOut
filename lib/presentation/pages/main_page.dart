import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:stepout/presentation/pages/accountpage/account_page.dart';
import 'package:stepout/presentation/pages/favoritepage/fav_page.dart';
import 'package:stepout/presentation/pages/homescreen/home_screen.dart';
import 'package:stepout/presentation/pages/orderspage/order_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedindex = 0;
  final List pages = [
    HomeScreen(),
    OrderPage(),
    FavPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedindex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GNav(
            onTabChange: (index) {
              setState(() {
                _selectedindex = index;
              });
            },
            padding: EdgeInsets.all(16),
            tabBackgroundColor: Color.fromARGB(255, 43, 43, 43),
            selectedIndex: _selectedindex,
            gap: 8,
            activeColor: Colors.white,
            color: Colors.white,
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            tabs: [
              GButton(
                icon: Icons.home_outlined,
                text: 'Home',
                textStyle: GoogleFonts.itim(
                    color: Colors.white, textStyle: TextStyle(fontSize: 18)),
              ),
              GButton(
                icon: Icons.card_travel,
                text: 'Orders',
                textStyle: GoogleFonts.itim(
                    color: Colors.white, textStyle: TextStyle(fontSize: 18)),
              ),
              GButton(
                icon: Icons.favorite_border,
                text: 'Favorite',
                textStyle: GoogleFonts.itim(
                    color: Colors.white, textStyle: TextStyle(fontSize: 18)),
              ),
              GButton(
                icon: Icons.person_2_outlined,
                text: 'Account',
                textStyle: GoogleFonts.itim(
                    color: Colors.white, textStyle: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

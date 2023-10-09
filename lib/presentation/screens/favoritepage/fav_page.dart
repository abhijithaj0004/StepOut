import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepout/businesslogic/wishlist/wish_list_cubit.dart';
import 'package:stepout/presentation/core/constants.dart';
import 'package:stepout/presentation/screens/favoritepage/wish_list_tile.dart';

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
    context.read<WishListCubit>().getWishList();
    final wishlist = context.read<WishListCubit>().state.wishList;
    debugPrint('From screen ${wishlist.length}');
    // context.read<WishListCubit>().getWishList();
    // context.read<WishListCubit>().getProductData();
    // // context.read<WishListCubit>();
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          leading: const StepOutImg(),
          title: Text(
            'Favorites',
            style: GoogleFonts.itim(textStyle: const TextStyle(fontSize: 25)),
          ),
        ),
        body: const WishtileList());
  }
}

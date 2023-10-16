import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stepout/services/wish_list_service.dart';

part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit()
      : super(WishListInitial(
            isFav: false, wishList: [], displayList: [], productList: []));
  remove(id, BuildContext context) async {
    state.wishList.remove(id);
    log('from cubit wishlist length:${state.wishList.length.toString()}');
    log('from cubit product id :$id');
    WishListService().deleteProductFromFav(id, context);
    emit(WishListState(
        isFav: state.isFav,
        wishList: state.wishList,
        displayList: state.displayList,
        productList: state.productList));
  }

  getWishList() async {
    state.wishList.clear();
    state.wishList = await FirebaseFirestore.instance
        .collection('users')
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('wish_list')
        .get()
        .then((value) => value.docs.map((element) => element.id).toList());
    emit(WishListState(
      isFav: state.isFav,
      wishList: state.wishList,
      displayList: state.displayList,
      productList: state.productList,
    ));
  }
}

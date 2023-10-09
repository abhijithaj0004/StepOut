import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stepout/model/wishlist_model.dart';
import 'package:stepout/services/wish_list_service.dart';

part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit()
      : super(WishListInitial(
            isFav: false, wishList: [], displayList: [], productList: []));
  // toggleIcon() {
  //   state.isFav = !state.isFav;
  //   emit(WishListState(
  //       isFav: state.isFav,
  //       wishList: state.wishList,
  //       displayList: [],
  //       productList: []));
  // }

  // add(WishListModel wishListModel, BuildContext context) async {
  //   state.wishList.add(WishListService().addProductstoFav(
  //       wishListModel.id,
  //       wishListModel.name,
  //       wishListModel.description,
  //       wishListModel.amount,
  //       wishListModel.image,
  //       wishListModel.size,
  //       context));
  //   log('from cubit wishlist length:${state.wishList.length.toString()}');
  //   log('from cubit product id :$wishListModel');
  //   WishListService().addProductstoFav(
  //       wishListModel.id,
  //       wishListModel.name,
  //       wishListModel.description,
  //       wishListModel.amount,
  //       wishListModel.image,
  //       wishListModel.size,
  //       context);
  //   emit(WishListState(
  //       isFav: state.isFav,
  //       wishList: state.wishList,
  //       displayList: state.displayList,
  //       productList: state.productList));
  // }

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

  // getProductData() async {
  //   state.displayList.clear();
  //   state.productList = await FirebaseFirestore.instance
  //       .collection('product_list')
  //       .get()
  //       .then((value) => value.docs
  //           .map((e) => {
  //                 'id': e.id,
  //                 'name': e['name'],
  //                 'image': e['image'],
  //                 'amount': e['amount'],
  //                 'categoryList': e['categoryList'],
  //                 'size': e['size'],
  //                 'description': e['description'],
  //               })
  //           .toList());

  //   // log(state.wishList.toString());
  //   for (int i = 0; i < state.productList.length; i++) {
  //     for (int j = 0; j < state.wishList.length; j++) {
  //       if (state.productList[i]['id'] == state.wishList[j]['product_id']) {
  //         state.displayList.add(state.productList[i]);
  //       }
  //       // log(state.wishList[j]['id']);
  //       // log(state.productList[i]['id']);

  //       // log(state.displayList.toString());
  //     }
  //   }
  //   emit(WishListState(
  //       isFav: false,
  //       wishList: state.wishList,
  //       displayList: state.displayList,
  //       productList: state.productList));
  // }
}

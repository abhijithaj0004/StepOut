part of 'wish_list_cubit.dart';

class WishListState {
  bool isFav;
  List wishList;
  List productList;
  List displayList;
  WishListModel? wishListModel;
  WishListState(
      {required this.isFav,
      required this.wishList,
      required this.displayList,
      required this.productList});
}

class WishListInitial extends WishListState {
  WishListInitial({
    required super.isFav,
    required super.wishList,
    required super.displayList,
    required super.productList,
  });
}

part of 'wish_list_cubit.dart';

class WishListState {
  bool isFav;
  List wishList;
  WishListState(this.isFav,this.wishList);
}

final class WishListInitial extends WishListState {
  WishListInitial(super.isFav, super.wishList);
}

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stepout/presentation/functions/dbfns/db_functions.dart';

part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit() : super(WishListInitial(false, []));
  // void addToFav() {
  //   state.isFav = !state.isFav;

  //   emit(WishListState(state.isFav,state.wishList));
  // }
  getWishList(String productId) async {
    final res = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentEmail)
        .collection('wish_list')
        .doc(productId)
        .get();
    
  }
}

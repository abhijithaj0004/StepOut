import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'cart_total_amount_state.dart';

class CartTotalAmountCubit extends Cubit<CartTotalAmountState> {
  CartTotalAmountCubit()
      : super(CartTotalAmountInitial(totalAmount: 0.00, shippingCharge: 0.00));
  void calculateTotalAmount(List<DocumentSnapshot> cartitems) {
    double totalAmount = 0.0;

    for (final item in cartitems) {
      final amount = item['amount'];
      final quantity = item['quantity'];
      totalAmount += amount * quantity;
    }
    if (totalAmount >= 15000) {
      state.shippingCharge = 1200;
    } else if (totalAmount < 8000 && totalAmount > 1000) {
      state.shippingCharge = 600;
    } else if (totalAmount > 8000 && totalAmount < 15000) {
      state.shippingCharge = 700;
    } else {
      state.shippingCharge = 100;
    }

    emit(CartTotalAmountState(
        totalAmount: totalAmount, shippingCharge: state.shippingCharge));
  }
}

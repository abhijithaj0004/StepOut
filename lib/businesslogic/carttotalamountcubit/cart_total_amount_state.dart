part of 'cart_total_amount_cubit.dart';

class CartTotalAmountState {
  double totalAmount;
  CartTotalAmountState({required this.totalAmount,required this.shippingCharge});
  double shippingCharge;
}

final class CartTotalAmountInitial extends CartTotalAmountState {
  CartTotalAmountInitial({required super.totalAmount, required super.shippingCharge});
}

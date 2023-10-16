part of 'productdetail_cubit.dart';

class ProductdetailState {
  int selectedndex;
   String selectedSize;
  ProductdetailState( {required this.selectedndex,required this.selectedSize});
}

final class ProductdetailInitial extends ProductdetailState {
  ProductdetailInitial( {required super.selectedndex, required super.selectedSize});
}

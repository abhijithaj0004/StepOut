import 'package:bloc/bloc.dart';

part 'productdetail_state.dart';

class ProductdetailCubit extends Cubit<ProductdetailState> {
  ProductdetailCubit()
      : super(ProductdetailInitial(selectedndex: -1, selectedSize: ''));
  toggleColor(index) {
    state.selectedndex = index;
    emit(ProductdetailState(selectedndex: state.selectedndex,selectedSize: state.selectedSize));
  }

  getSelectedSize(productsize) {
    state.selectedSize = productsize;
    emit(ProductdetailState(
        selectedndex: state.selectedndex, selectedSize: state.selectedSize));
  }
}

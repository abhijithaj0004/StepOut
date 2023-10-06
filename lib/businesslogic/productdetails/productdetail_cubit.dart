import 'package:bloc/bloc.dart';

part 'productdetail_state.dart';

class ProductdetailCubit extends Cubit<ProductdetailState> {
  ProductdetailCubit() : super(ProductdetailInitial(selectedndex: -1));
  toggleColor(index) {
    state.selectedndex = index;
    emit(ProductdetailState(selectedndex: state.selectedndex));
  }
}

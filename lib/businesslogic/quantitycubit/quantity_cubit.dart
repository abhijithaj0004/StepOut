import 'package:bloc/bloc.dart';

part 'quantity_state.dart';

class QuantityCubit extends Cubit<QuantityState> {
  QuantityCubit() : super(QuantityInitial(quantity: 1));
  incrementQnty() {
    state.quantity = state.quantity + 1;
    emit(QuantityState(quantity: state.quantity));
  }

  decrementQnty() {
    state.quantity = state.quantity - 1;
    emit(QuantityState(quantity: state.quantity));
  }
}

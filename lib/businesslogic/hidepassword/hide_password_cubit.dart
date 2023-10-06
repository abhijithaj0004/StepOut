import 'package:bloc/bloc.dart';

part 'hide_password_state.dart';

class HidePasswordCubit extends Cubit<HidePasswordState> {
  HidePasswordCubit() : super(HidePasswordInitial(ischanged: true));
  toggle() {
    state.ischanged = !state.ischanged;
    emit(HidePasswordState(ischanged: state.ischanged));
  }
}

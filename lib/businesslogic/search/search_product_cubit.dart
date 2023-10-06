import 'package:bloc/bloc.dart';

part 'search_product_state.dart';

class SearchProductCubit extends Cubit<SearchProductState> {
  SearchProductCubit() : super(SearchProductInitial(''));
  search(String value) async {
    state.searchedName = value;
    emit(SearchProductState(state.searchedName));
  }
}


import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial(isDocumentExist: false));
  checkIfDocumentsExist() async {
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc('${FirebaseAuth.instance.currentUser!.email}')
        .collection('address')
        .get();
    // log(querySnapshot.docs.toString());
    state.isDocumentExist = querySnapshot.docs.isNotEmpty;
    emit(AddressState(isDocumentExist: state.isDocumentExist));
  }
}

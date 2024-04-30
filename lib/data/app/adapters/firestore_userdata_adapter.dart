import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sellusapp/data/app/adapters/base/firestore_base_adapter.dart';
import 'package:sellusapp/data/app/models/userdata_model.dart';
import 'package:sellusapp/utils/constants/api_constants.dart';

class FirestoreUserDataAdapter extends FirestoreBaseAdapter<UserDataModel> {
  @override
  CollectionReference<Map<String, dynamic>> get collectionRef =>
      instance.collection(
        ApiConstants.firestoreUserCollection,
      );

  @override
  Future writeDoc({
    required UserDataModel data,
    String? id,
  }) async {
    await collectionRef.doc(id).set(data.fromJson());
  }
  @override
  Future updateDoc({
    required UserDataModel data,
    required String id,
  }) async {
    await collectionRef.doc(id).update(data.fromJson());
  }
  @override
  Future deleteDoc({
    required String id,
  }) async {
    await collectionRef.doc(id).delete();
  }

}

import 'package:sellusapp/data/app/adapters/base/firestore_base_adapter.dart';
import 'package:sellusapp/data/app/adapters/firestore_userdata_adapter.dart';
import 'package:sellusapp/data/app/base/firestore_base.dart';
import 'package:sellusapp/data/app/models/userdata_model.dart';

class FirestoreUserData extends FirestoreBase<UserDataModel> {
  @override
  FirestoreBaseAdapter get adapter => FirestoreUserDataAdapter();
  
 
}

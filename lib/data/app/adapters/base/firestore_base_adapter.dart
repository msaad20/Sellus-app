import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirestoreBaseAdapter<T> {
  FirebaseFirestore get instance => FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>> get collectionRef;
  Future writeDoc({String? id, required T data});
  Future updateDoc({required String id, required T data,});
  Future deleteDoc({required String id});

}

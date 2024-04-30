import 'package:sellusapp/data/app/adapters/base/firestore_base_adapter.dart';

abstract class FirestoreBase<T> {
  FirestoreBaseAdapter get adapter;
  Future<P?> execWrapper<P>(Future<P> Function() callback) async {
    try {
      P result = await callback();
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future writeDoc({
    String? id,
    required T data,
  }) {
    return execWrapper(() {
      return adapter.writeDoc(
        id: id,
        data: data,
      );
    });
  }

  Future update({
    required String id,
    required T data,
  }) {
    return execWrapper(() {
      return adapter.updateDoc(
        id: id,
        data: data,
      );
    });
  }

  Future deleteDoc({
    required String id,
  }) {
    return execWrapper(() {
      return adapter.deleteDoc(id: id);
    });
  }
}

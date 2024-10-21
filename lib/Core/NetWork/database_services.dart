import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  DatabaseServices();

  Future<void> post(
      {required String endPoint, required Map<String, dynamic> body}) async {
    await FirebaseFirestore.instance.collection(endPoint).add(body);
  }

  Future<QuerySnapshot<Map<String,dynamic>>> getCollection(
      {required String endPoint}) async {
    return await FirebaseFirestore.instance.collection(endPoint).get();
  }

  Future<DocumentSnapshot<Map<String,dynamic>?>> get(
      {required String endPoint, required String docId}) async {
    return await FirebaseFirestore.instance
        .collection(endPoint)
        .doc(docId)
        .get();
  }

  Future<void> update(
      {required String endPoint,
      required Map<String, dynamic> body,
      required String docId}) async {
    await FirebaseFirestore.instance
        .collection(endPoint)
        .doc(docId)
        .update(body);
  }

  Future<void> delete({required String endPoint, required String docId}) async {
    await FirebaseFirestore.instance.collection(endPoint).doc(docId).delete();
  }
}

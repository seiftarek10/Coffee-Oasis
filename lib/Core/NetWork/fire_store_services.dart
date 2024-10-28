import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Core/Models/fire_base_path_param.dart';

 class FireStoreServices {
  FireStoreServices();

  Future<void> postDoc(
      {required String endPoint, required Map<String, dynamic> body}) async {
    await FirebaseFirestore.instance.collection(endPoint).add(body);
  }

  Future<void> postToSubCollection(
      {required FireBasePathParam fireBasePathParam,
      required Map<String, dynamic> body}) async {
    await FirebaseFirestore.instance
        .collection(fireBasePathParam.parentCollection)
        .doc(fireBasePathParam.parentDocId)
        .collection(fireBasePathParam.subCollection!)
        .add(body);
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getCollection(
      {required String endPoint}) async {
    return await FirebaseFirestore.instance.collection(endPoint).get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>?>> getDoc(
      {required String endPoint, required String docId}) async {
    return await FirebaseFirestore.instance
        .collection(endPoint)
        .doc(docId)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getSubCollection({
    required FireBasePathParam fireBasePathParam,
  }) async {
    return await FirebaseFirestore.instance
        .collection(fireBasePathParam.parentCollection)
        .doc(fireBasePathParam.parentDocId)
        .collection(fireBasePathParam.subCollection!)
        .get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getDocFromSubCollection({
    required FireBasePathParam fireBasePathParam,
  }) async {
    return await FirebaseFirestore.instance
        .collection(fireBasePathParam.parentCollection)
        .doc(fireBasePathParam.parentDocId)
        .collection(fireBasePathParam.subCollection!)
        .doc(fireBasePathParam.subDocId)
        .get();
  }

  Future<void> updateDoc(
      {required String endPoint,
      required Map<String, dynamic> body,
      required String docId}) async {
    await FirebaseFirestore.instance
        .collection(endPoint)
        .doc(docId)
        .update(body);
  }

  Future<void> updateDocFromSubCollection({
    required FireBasePathParam fireBasePathParam,
    required Map<String, dynamic> body,
  }) async {
    await FirebaseFirestore.instance
        .collection(fireBasePathParam.parentCollection)
        .doc(fireBasePathParam.parentDocId)
        .collection(fireBasePathParam.subCollection!)
        .doc(fireBasePathParam.subDocId)
        .update(body);
  }

  Future<void> deleteDoc(
      {required String endPoint, required String docId}) async {
    await FirebaseFirestore.instance.collection(endPoint).doc(docId).delete();
  }

  Future<void> deleteDocFromSubCollection(
      {required FireBasePathParam fireBasePathParam}) async {
    await FirebaseFirestore.instance
        .collection(fireBasePathParam.parentCollection)
        .doc(fireBasePathParam.parentDocId)
        .collection(fireBasePathParam.subCollection!)
        .doc(fireBasePathParam.subDocId)
        .delete();
  }
}

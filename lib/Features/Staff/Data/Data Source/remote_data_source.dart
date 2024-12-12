import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_order_entity.dart';
import 'package:coffee_oasis/Core/Constant/endpoints.dart';
import 'package:coffee_oasis/Core/NetWork/Fire%20Base/fire_store_services.dart';

abstract class StaffRemoteDataSource {
  Stream<List<UserOrderEntity>> getDeliveryOrders();
  Stream<List<UserOrderEntity>> getPickupOrders();
  Future<void> submitDeliveryOrder({required UserOrderEntity userOrder});
  Future<void> submitPickUpyOrder({required UserOrderEntity userOrder});
}

class StaffRemoteDataSourceImpl implements StaffRemoteDataSource {
  final FireStoreServices _fireStoreServices;

  StaffRemoteDataSourceImpl({required FireStoreServices fireStoreServices})
      : _fireStoreServices = fireStoreServices;
  @override
  Stream<List<UserOrderEntity>> getDeliveryOrders() async* {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    await for (final allOrdersSnapshot
        in firestore.collection(EndPoints.deliveryOrders).snapshots()) {
      final List<UserOrderEntity> allOrders = [];

      for (final orderDoc in allOrdersSnapshot.docs) {
        final userOrdersSnapshot = await _fireStoreServices.getDoc(
            endPoint: EndPoints.deliveryOrders, docId: orderDoc.id);

        if (userOrdersSnapshot.exists) {
          final userOrderEntity =
              UserOrderEntity.fromStream(userOrdersSnapshot);

          allOrders.add(userOrderEntity);
        }
      }

      yield allOrders;
    }
  }

  @override
  Stream<List<UserOrderEntity>> getPickupOrders() async* {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    await for (final allOrdersSnapshot
        in firestore.collection(EndPoints.pickupOrders).snapshots()) {
      final List<UserOrderEntity> allOrders = [];

      for (final orderDoc in allOrdersSnapshot.docs) {
        final userOrdersSnapshot = await _fireStoreServices.getDoc(
            endPoint: EndPoints.pickupOrders, docId: orderDoc.id);

        if (userOrdersSnapshot.exists) {
          final userOrderEntity =
              UserOrderEntity.fromStream(userOrdersSnapshot);
          allOrders.add(userOrderEntity);
        }
      }

      yield allOrders;
    }
  }

  @override
  Future<void> submitDeliveryOrder({required UserOrderEntity userOrder}) async {
    if (userOrder.id == null) {
      return;
    }
    await _fireStoreServices.deleteDoc(
        endPoint: EndPoints.deliveryOrders, docId: userOrder.id!);
    await _fireStoreServices.postDoc(
      endPoint: EndPoints.ownerDeliveryOrders,
      body: userOrder.toJson(),
    );
  }

  @override
  Future<void> submitPickUpyOrder({required UserOrderEntity userOrder}) async {
    if (userOrder.id == null) {
      return;
    }
    await _fireStoreServices.deleteDoc(
        endPoint: EndPoints.pickupOrders, docId: userOrder.id!);
    await _fireStoreServices.postDoc(
      endPoint: EndPoints.ownerPickUpOrders,
      body: userOrder.toJson(),
    );
  }
}

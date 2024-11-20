import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_order_entity.dart';
import 'package:coffee_oasis/Core/Constant/endpoints.dart';
import 'package:coffee_oasis/Core/NetWork/fire_store_services.dart';

abstract class StaffRemoteDataSource {
  Stream<List<UserOrderEntity>> getAllOrders({required bool isDelivery});
  Future<void> submitOrder({required String orderId, required String coffeeId});
}

class StaffRemoteDataSourceImpl implements StaffRemoteDataSource {
  final FireStoreServices _fireStoreServices;

  StaffRemoteDataSourceImpl({required FireStoreServices fireStoreServices})
      : _fireStoreServices = fireStoreServices;
  @override
  Stream<List<UserOrderEntity>> getAllOrders(
      {required bool isDelivery}) async* {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    await for (final allOrdersSnapshot
        in firestore.collection(EndPoints.deliveryOrders).snapshots()) {
      final List<UserOrderEntity> allFilteredOrders = [];

      for (final orderDoc in allOrdersSnapshot.docs) {
        final userOrdersSnapshot = await _fireStoreServices.getDoc(
            endPoint: EndPoints.deliveryOrders, docId: orderDoc.id);

        if (userOrdersSnapshot.exists) {
          final data = userOrdersSnapshot.data() as Map<String, dynamic>;
          final coffeeList = data['coffee'] as List<dynamic>?;

          final hasMatchingDelivery = coffeeList?.any((item) {
                bool handleIsDeliveryNull = item['isDelivery'] ?? true;
                return handleIsDeliveryNull == isDelivery;
              }) ??
              false;

          if (hasMatchingDelivery) {
            final userOrderEntity =
                UserOrderEntity.fromStream(userOrdersSnapshot);
            allFilteredOrders.add(userOrderEntity);
          }
        }
      }

      yield allFilteredOrders;
    }
  }

  @override
  Future<void> submitOrder(
      {required String orderId, required String coffeeId}) async {
    // DocumentSnapshot<Map<String, dynamic>> data = await _fireStoreServices
    //     .getDoc(endPoint: EndPoints.allOrders, docId: orderId);
    // final userOrder = data.data() as Map<String, dynamic>;
    // final userOrderCoffee = userOrder['coffee'] as List<dynamic>;
    // bool isExist =
    //     userOrderCoffee.any((coffee) => coffee['coffee']['id'] == coffeeId);
    // if (isExist) {
    //   userOrderCoffee
    //       .removeWhere((coffee) => coffee['coffee']['id'] == coffeeId);
    // }
  }
}

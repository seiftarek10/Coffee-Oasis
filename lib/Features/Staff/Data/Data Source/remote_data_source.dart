import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Core/Constant/endpoints.dart';
import 'package:coffee_oasis/Core/Models/order_model.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/order_item_entity.dart';

abstract class StaffRemoteDataSource {
  Stream<List<OrderItemEntity>> getAllOrders({required bool isDelivery});
  Stream<List<OrderItemEntity>> getUserOrders(
      {required bool isDelivery, required String id});
}

class StaffRemoteDataSourceImpl implements StaffRemoteDataSource {
  @override
  Stream<List<OrderItemEntity>> getUserOrders(
      {required bool isDelivery, required String id}) {
    return FirebaseFirestore.instance
        .collection(EndPoints.allOrders)
        .doc(id)
        .collection(EndPoints.userOrders)
        .where('isDelivery', isEqualTo: isDelivery)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return OrderModel.fromJson(doc.data(), doc.id);
      }).toList();
    });
  }

  @override
  Stream<List<OrderItemEntity>> getAllOrders(
      {required bool isDelivery}) async* {
    final List<OrderModel> allFilteredOrders = [];

    await for (final allOrdersSnapshot in FirebaseFirestore.instance
        .collection(EndPoints.allOrders)
        .snapshots()) {
      for (final orderDoc in allOrdersSnapshot.docs) {
        final userOrdersSnapshot = await FirebaseFirestore.instance
            .collection(EndPoints.allOrders)
            .doc(orderDoc.id)
            .collection(EndPoints.userOrders)
            .get();

        userOrdersSnapshot.docs.map((doc) {
          allFilteredOrders.add(OrderModel.fromJson(doc.data(), doc.id));
        });
      }

      yield allFilteredOrders;
    }
  }
}

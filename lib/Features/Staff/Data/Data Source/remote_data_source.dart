import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_order_entity.dart';
import 'package:coffee_oasis/Core/Constant/endpoints.dart';

abstract class StaffRemoteDataSource {
  Stream<List<UserOrderEntity>> getAllOrders({required bool isDelivery});
}

class StaffRemoteDataSourceImpl implements StaffRemoteDataSource {
  @override
  Stream<List<UserOrderEntity>> getAllOrders(
      {required bool isDelivery}) async* {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    await for (final allOrdersSnapshot
        in firestore.collection(EndPoints.allOrders).snapshots()) {
      final List<UserOrderEntity> allFilteredOrders = [];

      for (final orderDoc in allOrdersSnapshot.docs) {
        final userOrdersSnapshot = await firestore
            .collection(EndPoints.allOrders)
            .doc(orderDoc.id)
            .get();

        if (userOrdersSnapshot.exists) {
          final data = userOrdersSnapshot.data() as Map<String, dynamic>;
          final coffeeList = data['coffee'] as List<dynamic>?;

          final hasMatchingDelivery = coffeeList?.any((item) {
                return item['isDelivery'] == isDelivery;
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
}

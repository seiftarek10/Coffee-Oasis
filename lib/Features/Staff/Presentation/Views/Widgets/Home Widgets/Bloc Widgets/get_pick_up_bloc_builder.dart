import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Core/Constant/endpoints.dart';
import 'package:coffee_oasis/Core/Widgets/States%20Widgets/circular_indicator.dart';
import 'package:coffee_oasis/Core/Widgets/States%20Widgets/empty_widget.dart';
import 'package:coffee_oasis/Core/Widgets/States%20Widgets/error_widget.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/Home%20Widgets/pick_up_orders_list_view.dart';
import 'package:flutter/material.dart';

class GetPickUpBlocBuilder extends StatelessWidget {
  const GetPickUpBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(EndPoints.allOrders)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return _buildSuccessBody(snapshot.data!.docs);
          } else if (snapshot.hasError) {
            return _buildErrorBody();
          } else {
            return _buildLoadingBody();
          }
        });
  }

  Widget _buildSuccessBody(List<QueryDocumentSnapshot<Object?>> orders) {
    if (orders.isEmpty) {
      return const AppEmptyWidget(height: 0.6);
    }
    return const PickUpOrdersListView();
  }

  Widget _buildErrorBody() {
    return AppErrorWidget(
        height: 0.6, onTap: () {}, text: 'some Thing Is Wrong');
  }

  Widget _buildLoadingBody() {
    return const AppCircularIndicator(height: 0.6);
  }
}

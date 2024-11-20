import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Widgets/rich_header_text.dart';
import 'package:coffee_oasis/Core/Widgets/search_filed.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/View%20Model/Cubits/Get%20All%20Orders/staff_get_all_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StaffHomeHeader extends StatelessWidget {
  const StaffHomeHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const RichHeaderText(
          title: 'Orders',
          subTitle: [
            'Manage Coffee Oasis ',
            'orders ',
            'with real-time updates for ',
            'smooth service'
          ],
        ),
        Space.k20,
        SearchField(
          title: 'Search With User Name',
          onChanged: (searchedWord) {
            BlocProvider.of<StaffGetAllOrdersCubit>(context)
                .searchOrders(word: searchedWord);
          },
        ),
      ],
    );
  }
}

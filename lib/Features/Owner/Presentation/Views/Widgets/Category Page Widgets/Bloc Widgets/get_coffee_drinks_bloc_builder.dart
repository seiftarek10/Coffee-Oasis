import 'package:coffee_oasis/Core/Widgets/States%20Widgets/empty_widget.dart';
import 'package:coffee_oasis/Core/Widgets/States%20Widgets/error_widget.dart';
import 'package:coffee_oasis/Core/Widgets/States%20Widgets/loading_widget.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/coffee_entity.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/get_category_coffee_drinks.dart/get_category_coffee_drinks_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/coffee_drink_item.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/coffee_drinks_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCoffeeDrinksBlocBuilder extends StatelessWidget {
  const GetCoffeeDrinksBlocBuilder(
      {super.key,
      required this.id,
      required this.getCategoryCoffeeDrinksCubit});
  final String id;
  final GetCategoryCoffeeDrinksCubit getCategoryCoffeeDrinksCubit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoryCoffeeDrinksCubit,
        GetCategoryCoffeeDrinksState>(
      builder: (context, state) {
        if (state is GetCategoryCoffeeDrinksFailure) {
          return _buildErrorWidget(context, state.errMessage);
        } else if (state is GetCategoryCoffeeDrinksSuccess) {
          return _buildSuccessWidget(state.coffeeDrinks);
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildErrorWidget(BuildContext context, String errMessage) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(minHeight: MediaQuery.sizeOf(context).height * 0.8),
      child: Center(
        child: AppErrorWidget(
            onTap: () {
              context
                  .read<GetCategoryCoffeeDrinksCubit>()
                  .getCategoryCoffeeDrink(id: id, remoteSource: true);
            },
            text: errMessage),
      ),
    );
  }

  Widget _buildSuccessWidget(List<CoffeeEntity> coffee) {
    if (coffee.isEmpty) {
      return const EmptyWidget(
        height: 0.7,
      );
    }
    return CoffeeDrinksListView(
      coffeeDrinks: coffee,
      id: id,
      getCategoryCoffeeDrinksCubit: getCategoryCoffeeDrinksCubit,
    );
  }

  Widget _buildLoadingWidget() {
    return const Expanded(
        child: SingleChildScrollView(
            child: AppLoadingWidget(child: CoffeeDrinkItem())));
  }
}

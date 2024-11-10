import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Get%20Cart%20Items/get_cart_items_cubit.dart';

class CoffeeDetailsExtra {
  final OrderEntity orderEntity;
  final bool fromCartView;
  final GetCartItemsCubit? getCartItemsCubit;

  CoffeeDetailsExtra(
      {required this.orderEntity,
      required this.fromCartView,
      this.getCartItemsCubit});
}

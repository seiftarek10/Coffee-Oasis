class PayPalInputModel {
  final String amount;
  final PayPalOrderItemModel order;

  PayPalInputModel({required this.order, required this.amount});
}

class PayPalOrderItemModel {
  final String name;
  final int quantity;
  final String price;

  PayPalOrderItemModel(
      {required this.name, required this.quantity, required this.price});
}

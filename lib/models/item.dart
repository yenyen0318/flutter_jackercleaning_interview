class Item {
  final String title;
  final int price;
  final int? quantity;

  Item({
    required this.title,
    required this.price,
    this.quantity
  });
}

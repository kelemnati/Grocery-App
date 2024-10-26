class ProductDataModel {
  final int id;
  final String name;
  final String category;
  final double price;
  final int quantity;
  final String image;
  final String description;

  ProductDataModel(
      {required this.id,
      required this.name,
      required this.category,
      required this.price,
      required this.quantity,
      required this.image,
      required this.description});
}

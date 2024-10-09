class Product {
  final String name;
  final String price;
  final String description;
  final String imageUrl;
  final List<String> images;
  final int quantity;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
    required this.description,
    required this.images
  });
}
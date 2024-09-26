class Product {
  final String name;
  final String price;
  final String imageUrl;
  final int quantity;

  Product({required this.name, required this.price, required this.imageUrl, this.quantity = 1});
}
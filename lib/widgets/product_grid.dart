import 'package:flutter/material.dart';
import 'package:kishan_se/helperFunctions/products.dart';
import 'package:kishan_se/widgets/product_item.dart';

class ProductGrid extends StatefulWidget {
  const ProductGrid({super.key});

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {

  final List<Product> products = [
    Product(name: 'Product 1', price: '\$100', imageUrl: 'https://thenewbaguette.com/wp-content/uploads/2022/04/how-to-cook-dried-beans.jpg'),
    Product(name: 'Product 2', price: '\$150', imageUrl: 'https://media.post.rvohealth.io/wp-content/uploads/2020/09/green-peas-thumb-1-732x549.jpg'),
    Product(name: 'Product 3', price: '\$200', imageUrl: 'https://i0.wp.com/post.medicalnewstoday.com/wp-content/uploads/sites/3/2022/04/chickpeas_closeup_1296x728_header-1024x575.jpg?w=1155&h=1528'),
    Product(name: 'Product 4', price: '\$250', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmGOtt8x0sIEfCe6uqeB9m7u3RInOnsphzSQ&s'),
    Product(name: 'Product 5', price: '\$100', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVoPw7CNdMY33fuV4zWmTSUxttbQT3UizD2A&s'),
    Product(name: 'Product 6', price: '\$150', imageUrl: 'https://thenewbaguette.com/wp-content/uploads/2022/04/how-to-cook-dried-beans.jpg'),
    Product(name: 'Product 7', price: '\$200', imageUrl: 'https://media.post.rvohealth.io/wp-content/uploads/2020/09/green-peas-thumb-1-732x549.jpg'),
    Product(name: 'Product 8', price: '\$100', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmGOtt8x0sIEfCe6uqeB9m7u3RInOnsphzSQ&s'),
    Product(name: 'Product 9', price: '\$150', imageUrl: 'https://thenewbaguette.com/wp-content/uploads/2022/04/how-to-cook-dried-beans.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
            crossAxisSpacing: 10, 
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
        ),
        itemBuilder: (context,index){
          final product = products[index];
          return ProductItem(product: product);
        },
        itemCount: products.length,
      ),
    );
  }
}
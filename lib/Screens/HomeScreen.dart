import 'package:flutter/material.dart';
import 'package:kishan_se/helperFunctions/cart.dart';
import 'package:kishan_se/widgets/product_grid.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Cart>(context).items;
    
    return Scaffold(
      body: ProductGrid(products: products),
    );
  }
}

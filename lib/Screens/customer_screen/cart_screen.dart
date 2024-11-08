import 'package:flutter/material.dart';
import 'package:kishan_se/Screens/customer_screen/product_details.dart';
import 'package:kishan_se/helperFunctions/cart.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
      ),
      body: cart.items.isEmpty
          ? const Center(child: Text("Your cart is empty"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final product = cart.items[index];
                      return ListTile(
                        onTap: ()=> Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context)=> ProductDetailsScreen(product: product)
                            )
                          ),
                        leading: Image.network(product.imageUrl, width: 50, height: 50),
                        title: Text(product.name),
                        subtitle: Text("Price: ${product.price}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            // Remove product from cart
                            cart.removeProduct(product);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Total: \$${cart.totalPrice.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

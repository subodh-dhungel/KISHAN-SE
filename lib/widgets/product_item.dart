import 'package:flutter/material.dart';
import 'package:kishan_se/Screens/customer_screen/product_details.dart';
import 'package:kishan_se/helperFunctions/cart.dart';
import 'package:kishan_se/helperFunctions/products.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to the ProductDetailsScreen and pass the selected product
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: product),
          ),
        );
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Expanded(
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 8),
            // Product Name
            Text(
              product.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            // Product Price and Cart Icon
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                  child: Text(
                    product.price,
                    style: const TextStyle(color: Colors.green, fontSize: 14),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => {
                    Provider.of<Cart>(context, listen: false).addProduct(product)
                  },
                  icon: const Icon(Icons.shopping_cart),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

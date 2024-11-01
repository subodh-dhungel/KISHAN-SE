import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kishan_se/helperFunctions/products.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;
  double rating = 0;
  String comment = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Images Carousel
            CarouselSlider(
              items: widget.product.images.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(image, fit: BoxFit.cover),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.5,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {},
              ),
            ),

            // Product Description
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.product.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),

            // Product Price
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.product.price,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),

            // Quantity Counter
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (quantity > 1) {
                        quantity--;
                      }
                    });
                  },
                ),
                Text(
                  '$quantity',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),

            // Rating and Comments Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Rating:', style: Theme.of(context).textTheme.titleMedium),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(5, (index) => IconButton(
                          icon: Icon(
                            index < rating ? Icons.star : Icons.star_border,
                            color: Colors.yellow,
                          ),
                          onPressed: () {
                            setState(() {
                              rating = index + 1;
                            });
                          },
                        )),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Comment',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (text) {
                      setState(() {
                        comment = text;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Floating Action Button for Rating and Comment
      floatingActionButton: FloatingActionButton.extended(
        label: Row(
          children: const [
            Icon(Icons.rate_review),
            SizedBox(width: 8),
            Text('Rate & Comment'),
          ],
        ),
        onPressed: () {
          // Submit the rating and comment (or handle further)
          print('Rating: $rating');
          print('Comment: $comment');
        },
      ),
    );
  }
}

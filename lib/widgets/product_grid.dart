import 'package:flutter/material.dart';
import 'package:kishan_se/helperFunctions/search_state.dart';
import 'package:kishan_se/helperFunctions/products.dart';
import 'package:kishan_se/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatefulWidget {
  final List<Product> products = [
    Product(
        name: 'Product 1',
        price: '\$100',
        imageUrl:
            'https://thenewbaguette.com/wp-content/uploads/2022/04/how-to-cook-dried-beans.jpg'),
    Product(
        name: 'Product 2',
        price: '\$150',
        imageUrl:
            'https://media.post.rvohealth.io/wp-content/uploads/2020/09/green-peas-thumb-1-732x549.jpg'),
    Product(
        name: 'Product 3',
        price: '\$200',
        imageUrl:
            'https://i0.wp.com/post.medicalnewstoday.com/wp-content/uploads/sites/3/2022/04/chickpeas_closeup_1296x728_header-1024x575.jpg?w=1155&h=1528'),
    Product(
        name: 'Product 4',
        price: '\$250',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmGOtt8x0sIEfCe6uqeB9m7u3RInOnsphzSQ&s'),
    Product(
        name: 'Product 5',
        price: '\$100',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVoPw7CNdMY33fuV4zWmTSUxttbQT3UizD2A&s'),
    Product(
        name: 'Product 6',
        price: '\$150',
        imageUrl:
            'https://thenewbaguette.com/wp-content/uploads/2022/04/how-to-cook-dried-beans.jpg'),
    Product(
        name: 'Product 7',
        price: '\$200',
        imageUrl:
            'https://media.post.rvohealth.io/wp-content/uploads/2020/09/green-peas-thumb-1-732x549.jpg'),
    Product(
        name: 'Product 8',
        price: '\$100',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmGOtt8x0sIEfCe6uqeB9m7u3RInOnsphzSQ&s'),
    Product(
        name: 'Product 9',
        price: '\$150',
        imageUrl:
            'https://thenewbaguette.com/wp-content/uploads/2022/04/how-to-cook-dried-beans.jpg'),
  ];

  ProductGrid({super.key, required List<Product> products});

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = widget.products;
  }

  void filterSearchResults(String query) {
    setState(() {
      filteredProducts = widget.products.where((product) {
        return product.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final searchState = Provider.of<Searchstate>(context).isSearchBarVisible;

    return Column(
      children: [
        searchState
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    filterSearchResults(value);
                  },
                  decoration: const InputDecoration(
                    labelText: "Search",
                    hintText: "Search products",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(), // Returns an empty widget if not visible

        Expanded(
          child: filteredProducts.isEmpty
              ? const Center(child: Text("No matching products found"))
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return ProductItem(product: product);
                    },
                  ),
                ),
        ),
      ],
    );
  }
}

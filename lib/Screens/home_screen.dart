import 'package:flutter/material.dart';
import 'package:kishan_se/helperFunctions/search_state.dart';
import 'package:kishan_se/helperFunctions/cart.dart';
import 'package:kishan_se/widgets/k_appbar.dart';
import 'package:kishan_se/widgets/k_drawer.dart';
import 'package:kishan_se/widgets/product_grid.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    final products = Provider.of<Cart>(context).items;
    final searchState = Provider.of<Searchstate>(context);

    return Scaffold(
      appBar: KAppBar(onSearchPressed: searchState.toggleSearchBar),
      drawer: const KDrawer(),
      body: ProductGrid(products: products),
    );
  }
}

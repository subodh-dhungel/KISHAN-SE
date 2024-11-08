import 'package:flutter/material.dart';
import 'package:kishan_se/Screens/customer_screen/home_screen.dart';
import 'package:kishan_se/helperFunctions/search_state.dart';
import 'package:kishan_se/helperFunctions/cart.dart';
import 'package:kishan_se/widgets/k_drawer.dart';
import 'package:kishan_se/widgets/k_appbar.dart';
import 'package:kishan_se/widgets/product_grid.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _searchController;
  final bool _isSearching = false;
  String? _lastSearchTerm;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _loadLastSearchTerm();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<String?> _loadLastSearchTerm() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('last_search_term');
  }

  @override
  Widget build(BuildContext context) {
    final searchState = Provider.of<Searchstate>(context);
    return Scaffold(
      appBar: KAppBar(onSearchPressed: searchState.toggleSearchBar),
      drawer: const KDrawer(),
      body: _isSearching
          ? _buildSearchResults()
          : const HomeScreen(),
    );
  }

  Widget _buildSearchResults() {
    final products = Provider.of<Cart>(context, listen: false).items;
    final filteredProducts = products.where((product) {
      String searchTerm = _lastSearchTerm ?? '';
      return product.name.toLowerCase().contains(searchTerm.toLowerCase());
    }).toList();

    if (filteredProducts.isNotEmpty) {
      return ProductGrid(products: filteredProducts);
    } else {
      return const Center(child: Text('No matching products found'));
    }
  }
}

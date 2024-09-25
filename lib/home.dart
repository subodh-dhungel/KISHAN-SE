import 'package:flutter/material.dart';
import 'package:kishan_se/Screens/HomeScreen.dart';
import 'package:kishan_se/widgets/k_appbar.dart';
import 'package:kishan_se/widgets/k-drawer.dart';
import 'package:kishan_se/widgets/k_search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _searchController;
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isSearching
          ? AppBar(
              title: KSearchBar(
                controller: _searchController,
                onClose: _toggleSearch,
              ),
            )
          : KAppBar(
              onSearchPressed: _toggleSearch,
            ),
      drawer: const KDrawer(),
      body: const HomeScreen(),
    );
  }
}

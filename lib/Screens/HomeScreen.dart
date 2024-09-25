import 'package:flutter/material.dart';
import 'package:kishan_se/widgets/product_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
        children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 30,
          child: const Center(
            child: Text("Welcome User!"),
          ),
        ),
        
        const Expanded(
          child: ProductGrid(),
        )
      ],
    ));
  }
}

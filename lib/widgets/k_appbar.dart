import 'package:flutter/material.dart';
import 'package:kishan_se/Screens/customer_screen/cart_screen.dart';
import 'package:kishan_se/helperFunctions/cart.dart';
import 'package:kishan_se/helperFunctions/get_user_location.dart';
import 'package:provider/provider.dart';

class KAppBar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback onSearchPressed;

  const KAppBar({super.key, required this.onSearchPressed});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  KAppBarState createState() => KAppBarState();
}

class KAppBarState extends State<KAppBar> {
  String location = 'Loading...';

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    try {
      String place = await getUserLocationShortForm();
      setState(() {
        location = place;
      });
    } catch (e) {
      setState(() {
        location = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<Cart>(context).items.length.toString();
    return AppBar(
      backgroundColor: const Color.fromARGB(80, 255, 255, 255),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          );
        },
      ),
      centerTitle: true,
      title: Row(
        children: [
          const Icon(Icons.location_on_outlined),
          Text(
            location,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: widget.onSearchPressed,
          icon: const Icon(Icons.search_rounded),
        ),
        Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartScreen()),
                );
              },
              icon: const Icon(Icons.shopping_cart_rounded),
            ),
            Positioned(
              right: 7,
              top: 7,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                constraints: const BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: Text(
                  cartItems,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

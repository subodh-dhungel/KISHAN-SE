import 'package:flutter/material.dart';
import 'package:kishan_se/Screens/customer_screen/profile_screen.dart';
import 'package:kishan_se/Screens/signin.dart';
import 'package:kishan_se/firebase/auth_service.dart';

class KDrawer extends StatelessWidget {
  const KDrawer({super.key});

  Future<void> _navigateToSignInPage(BuildContext context) async {
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => const SigninPage())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            child: Text(
              'Kishan Drawer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Navigate to home
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Navigate to settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              AuthService authservice = AuthService();
              await authservice.signOut();
              if(context.mounted){
                await _navigateToSignInPage(context);
              }
              // Log out
            },
          ),
        ],
      ),
    );
  }
}

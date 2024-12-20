import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kishan_se/Screens/customer_screen/home_screen.dart';
import 'package:kishan_se/firebase/auth_service.dart';
import 'package:kishan_se/helperFunctions/user_role.dart';
import 'package:kishan_se/widgets/login_button.dart';
import 'package:kishan_se/widgets/sign_in_failed_dialog.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage("assets/logo/agroGrain.png")),
            const SizedBox(height: 20),
            const Text(
              "Login or register account",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            LoginButton(
              provider: "Google",
              logoPath: "assets/logo/GoogleLogo.png",
              onPressed: () async {
                try {
                  final User? user = await authService.signInWithGoogle();
                  if (user != null && context.mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  }
                } catch (e) {
                  if (context.mounted) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SignInFailedDialog(onRetry: () {
                          authService.signInWithGoogle();
                        });
                      },
                    );
                  }
                }
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Are you a farmer?",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
                const SizedBox(width: 10),
                Consumer<UserRole>(
                  builder: (context, userRole, child) {
                    return Switch(
                      value: userRole.isFarmer,
                      onChanged: (bool value) {
                        userRole.toggleIsFarmer();
                      },
                      activeColor: Theme.of(context).colorScheme.primary,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

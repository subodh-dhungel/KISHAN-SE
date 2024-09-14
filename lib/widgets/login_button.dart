import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String provider;
  final String logoPath;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const LoginButton({
    super.key, 
    required this.provider, 
    required this.logoPath,
    required this.onPressed,
    this.width = 300, // default width if not provided
    this.height = 20,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: Size(width, height), // Setting the fixed width
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            logoPath,
            height: 24,
          ),
          const SizedBox(width: 12),
          Text(
            'Login with $provider',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SignInFailedDialog extends StatelessWidget {
  const SignInFailedDialog({super.key, required Null Function() onRetry});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Sign in failed"),
      content: const Text("Unfortunately, we were unable to sign you in because of some error."),
      actions: <Widget>[
        TextButton(
          child: const Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

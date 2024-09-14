import 'package:flutter/material.dart';
import 'package:kishan_se/firebase/facebook_sign_in.dart';
import 'package:kishan_se/firebase/google_sign_in.dart';
import 'package:kishan_se/widgets/login_button.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  googleLogin(){
    signInWithGoogle().then((user){

    }).catchError((e){

    });
  }

  facebookLogin(){
    signInWithFacebook().then((user){

    }).catchError((e){
      
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Image(image: AssetImage("assets/logo/agroGrain.png")),
            const SizedBox(height: 20,),
            const Text(
              "Login or register account",
              textScaler: TextScaler.linear(1.5),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 20,),
            LoginButton(
              provider: "Google",
              logoPath: "assets/logo/GoogleLogo.png",
              onPressed: googleLogin
            ),
            const SizedBox(height: 20,),
            LoginButton(
              provider: "Facebook",
              logoPath: "assets/logo/FacebookLogo.png",
              onPressed: facebookLogin
            )
          ],
        ),
      )
    );
  }
}
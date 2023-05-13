import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food/authentication/login_register.dart';

import '../pages/homepage.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // utilizador logado
          if(snapshot.hasData){
            return const HomePage();
          }

          // utilizador nao esta logado
          else{
            return const LoginRegister();
          }


        }),
    );
  }
}
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
  // sing out ao utilizador
  void signOut(){
    FirebaseAuth.instance.signOut();
  }


class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SIU"),
      actions: [
        // sign out
        IconButton(onPressed: signOut, icon: Icon(Icons.logout),
        )
      ],
      ),
    );
  }
}
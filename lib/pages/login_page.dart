import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food/components/my_button.dart';
import 'package:food/components/my_textfield.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({
    super.key,
    required this.onTap,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

// sign utilizador
  void signIn() async {


// mostrar loading
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
 

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

 // para loading
    if(context.mounted) Navigator.pop(context);

    } on FirebaseAuthException catch (e) {
      // para loading
      Navigator.pop(context);
      // mostrar error
      displayMessage(e.code);

      //parar 
    }
  }

  //display error para o utlizador
  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                // logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                /*   const SizedBox(height: 50),
      
                // forgot password?
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
      */
                const SizedBox(height: 25),

                // sign up button
                MyButton(
                  onTap: signIn,
                  text: 'Sign In',
                ),

                const SizedBox(height: 10),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

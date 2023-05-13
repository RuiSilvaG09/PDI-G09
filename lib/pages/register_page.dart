import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordCOntroller = TextEditingController();



// registar utilizadores sign up
  void signUp() async{

    //mostrar loading 
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
        ),
    );

  // confirmar que as password são iguais

  if(passwordController.text != confirmpasswordCOntroller.text){
    // loading
    Navigator.pop(context);
    //mostrar erro 
    displayMessage("Passords não coincidem!");
    return;
  }

  try{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    if(context.mounted) Navigator.pop(context);
  } on FirebaseAuthException catch (e){
    // loading
    Navigator.pop(context);
    // mostrar erro 
    displayMessage(e.code);
  }

  }
  //mostrar mensagem ao utilizador
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
                  'Lets create an account',
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

                const SizedBox(height: 10),

                // confirm password textfield
                MyTextField(
                  controller: confirmpasswordCOntroller,
                  hintText: 'Confirm Password',
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
                  onTap: signUp, 
                  text: 'Sign Up'
                ),

                const SizedBox(height: 10),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Alredy have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                      'Login now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                    ),
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

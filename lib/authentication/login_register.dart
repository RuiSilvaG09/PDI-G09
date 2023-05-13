import 'package:flutter/material.dart';
import 'package:food/pages/login_page.dart';
import 'package:food/pages/register_page.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({super.key});

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  //mostrar pagina login
  bool showLoginPage=true;

  // andar pela pagina login e registo
  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(onTap: togglePages);
    }else{
      return RegisterPage(onTap: togglePages);
    }
  }
}
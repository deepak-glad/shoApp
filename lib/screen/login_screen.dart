import 'package:flutter/material.dart';
import 'package:shop_app2/widgets/login.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _submitAuthForm(
    String email,
    String password,
    String username,
    bool isLogin,
  ) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Login(_submitAuthForm),
    );
  }
}

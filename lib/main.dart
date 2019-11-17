import 'package:bankapp/login_page.dart';
import 'package:bankapp/main_page.dart';
import 'package:flutter/material.dart';

//TODO: Limpar o codigo

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/mainScreen': (context) => MainScreen()
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: LoginPage(),
    );
  }
}

class MainScreen extends StatelessWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainPage(
      items: <AppBarItem>[
        AppBarItem(iconData: Icons.account_balance, label: "Home"),
        AppBarItem(iconData: Icons.trending_up, label: "Expenses"),
        AppBarItem(iconData: Icons.account_balance_wallet, label: "Wallet"),
        AppBarItem(iconData: Icons.person, label: "Profile"),
      ],
      onTabSelected: (index) {
        //TODO
      },
    );
  }
}


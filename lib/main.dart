import 'package:bankapp/login_page.dart';
import 'package:bankapp/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//TODO: Limpar o codigo

void main() => runApp(MyApp());

void changeStatusColor(Color background, Brightness iconBrightness) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: background,
    statusBarIconBrightness: iconBrightness,
  ));
}

class Palette {
  //Backgrounds
  static final Color bWhite = Colors.white;
  static final Color bGrey = Colors.grey[200];
}

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
    changeStatusColor(Palette.bWhite, Brightness.dark);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Palette.bWhite,
      body: LoginPage(),
    );
  }
}

class MainScreen extends StatelessWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Palette.bGrey, Brightness.dark);
    return MainPage();
  }
}


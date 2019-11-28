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
  static const Color bWhite = Colors.white;
  static const Color bGrey = Color(0xFFF5F5F5);

  //Main Colors
  static const Color lightDarkBlue = Color(0xFF0045c7);
  static const Color lightDarkBlueAccent = Color(0xFF0c50cd);
  static const Color lightGreen = Color(0xFF29d85b);
  static const Color mainBlue = Color(0xFF0050e7);
  static const Color darkBlue = Color(0xFF1A237E);
  static const Color lightGrey = Color(0xFFBDBDBD);
  static const Color blueGrey = Color(0xFFdfe7f4);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bankapp Demo',
      
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
    // changeStatusColor(Palette.bWhite, Brightness.dark);
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
    // changeStatusColor(Palette.bGrey, Brightness.dark);
    return MainPage();
  }
}


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:circular_check_box/circular_check_box.dart';

const int kLightGreen = 0xFF29d85b;
const int kMainBlue = 0xFF0050e7;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _teste = true;
  bool _rememberMe = false;
  bool _validUsername = false;
  bool _autoValidate = false;
  bool _isHiddenPassword = true;
  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.addListener(() {
      setState(() {
        _autoValidate = true;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _validadeText(String text) {
    if(text.isNotEmpty) {
      setState(() {
        _validUsername = true; 
      });
    } else {
      setState(() {
        _validUsername = false; 
      });
    }
  }

  final double _buttonHeight = 45.0,  _borderRadius = 5.0, _borderWidth = 0.5, _buttonMargin = 7.0;
  Widget _buildThirdPartyLogin() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: Container(
              height: _buttonHeight,
              margin: EdgeInsets.only(right: _buttonMargin),
              child: FlatButton(
                onPressed: () {
                  //TODO
                },
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Image.asset("assets/facebook_fav.png"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(_borderRadius),
                  side: BorderSide(
                    width: _borderWidth,
                    color: Colors.grey,
                  )
                ),
              )
            )
          ),
          Expanded(
            child: Container(
              height: _buttonHeight,
              margin: EdgeInsets.only(left: _buttonMargin),
              child: FlatButton(
                onPressed: () {
                  //TODO
                },
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Image.asset("assets/google_fav.png"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(_borderRadius),
                  side: BorderSide(
                    width: _borderWidth,
                    color: Colors.grey,
                  )
                ),
              )
            )
          ),
        ],
      ),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          // Username
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: TextFormField(
              focusNode: _focusNode,
              autovalidate: _autoValidate,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Username",
                labelStyle: TextStyle(
                  color: Colors.grey
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(kLightGreen), 
                    width: 2.0
                  )
                ),
                suffixIcon: _validUsername ? Icon(
                  Icons.check_circle,
                  color: Color(kLightGreen),
                ) : null
              ),
              validator: (value) {
                print(value);
                if(value.isEmpty) {
                  return "Invalid Username";
                }
                return null;
              },
              onChanged: _validadeText,
            )
          ),
          // Password
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: TextFormField(
              obscureText: _isHiddenPassword,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Password",
                labelStyle: TextStyle(
                  color: Colors.grey
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(kLightGreen), 
                    width: 2.0
                  )
                ),
                suffixIcon:IconButton(
                  onPressed: () {
                    setState(() {
                      _isHiddenPassword = !_isHiddenPassword;
                    });
                  },
                  icon: _isHiddenPassword ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                  color: Colors.grey,
                )
              ),
            )
          )
        ],
      ),
    );
  }

  Widget _buildOptions() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 2.0),
                  child: CircularCheckBox(
                    value: _rememberMe,
                    onChanged: (newValue) {
                      setState(() {
                      _rememberMe = newValue; 
                      });
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  transform: Matrix4.translationValues(-10.0, 0, 0),
                ),
                Container(
                  child: const Text(
                    "Remember Me",
                    style: TextStyle(color: Colors.grey),
                  ),
                  transform: Matrix4.translationValues(-10.0, 0, 0),
                )
              ],
            ),
          ),
          GestureDetector(
            child: Text("Forgot Password?",style: TextStyle(color: Color(kMainBlue))),
            onTap: () {
              //TODO
            },
          )
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: SizedBox(
        width: double.infinity,
        child: RaisedButton(
          child: const Text(
            "Login", 
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0
            ),
          ),
          color: _teste ? Color(kMainBlue) : Colors.grey,
          onPressed: () {
            Navigator.pushNamed(context, "/mainScreen");
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: _teste ? Color(kMainBlue) : Colors.grey)
          ),
        ),
        height: 50.0,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(vertical: 18.0),
            child: IconButton(
              iconSize: 30.0,
              icon: Icon(Icons.keyboard_backspace),
              onPressed: () {
                //TODO
              },
            ),
            transform: Matrix4.translationValues(-12.0, 0, 0),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(bottom: 80.0),
            child: Text(
              "Welcome Login",
              style: TextStyle(
                color: Colors.indigo[900],
                fontSize: 30.0,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.left,
            )
          ),
          _buildThirdPartyLogin(),
          _buildLoginForm(),
          _buildOptions(),
          _buildLoginButton(),
          RichText(
            text: TextSpan(
              text: "Don't have a account? ",
              style: DefaultTextStyle.of(context).style.copyWith(color: Colors.grey, fontSize: 16.0),
              children: <TextSpan>[
                TextSpan(
                  text: "Sign up",
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      //TODO: Sign up
                      print("Sign up");
                    }
                )
              ]
            ),
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

final Color darkBlue = Color(0xFF23436b);

class CustomCard extends StatelessWidget {
  CustomCard({
    @required this.onTap,
    @required this.iconData,
    this.iconColor: Colors.white,
    this.iconBackground: Colors.grey,
    this.title,
    this.subTitle,
    this.sufix
  });

  final VoidCallback onTap;
  final IconData iconData;
  final Color iconColor;
  final Color iconBackground;
  final String title;
  final String subTitle;
  final Widget sufix;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(blurRadius: 18.0, color: Color.fromARGB(8, 0, 0, 0))
      ]),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(10.0),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    height: 50.0,
                    width: 50.0,
                    margin: EdgeInsets.only(right: 16.0),
                    decoration: BoxDecoration(
                      color: iconBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Icon(iconData, color: iconColor),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(
                              color: darkBlue,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          subTitle,
                          style: TextStyle(
                              color: Colors.grey[400], fontSize: 16.0),
                        )
                      ],
                    ),
                  ),
                  FittedBox(
                    child: Padding(
                      padding: EdgeInsets.only(right: 12.0),
                      child: sufix ?? Container(),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

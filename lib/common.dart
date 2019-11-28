import 'package:bankapp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'dart:math';

final Color darkBlue = Color(0xFF23436b);

class CustomCard extends StatelessWidget {
  CustomCard({
    @required this.onTap,
    @required this.iconData,
    this.iconColor: Colors.white,
    this.iconBackground: Colors.grey,
    this.title,
    this.subTitle,
    this.sufix,
    this.height
  });

  final VoidCallback onTap;
  final IconData iconData;
  final Color iconColor;
  final Color iconBackground;
  final String title;
  final String subTitle;
  final Widget sufix;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height == null ? null : height,
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
                    child: sufix ?? Container(width: 1.0, height: 1.0),
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  InfoCard({this.height, this.backgroundColor: Palette.bWhite, this.borderRadius: 20.0, this.margin, this.child});

  final double height;
  final Color backgroundColor;
  final double borderRadius;
  final EdgeInsets margin;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius)
      ),
      child: child
    );
  }
}

class Header extends StatelessWidget {
  Header({this.title, this.icon, this.onPressed});

  final Widget title;
  final Icon icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      width: double.infinity,
      margin: EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          title,
          IconButton(
            onPressed: onPressed,
            icon: icon
          )
        ],
      ),
    );
  }
}

class ProfileBackground extends CustomPainter {
  ProfileBackground(this.scrollLocation);

  double scrollLocation = 0;
  double height = 1;

  @override
  void paint(Canvas canvas, Size size) {
    print(scrollLocation);
    double width = size.width;
    height =  ((size.height/2.3) - scrollLocation).clamp(0.0, size.height);
    Paint paint = Paint()
      ..color = Palette.lightDarkBlue;
    
    canvas.drawRRect(RRect.fromLTRBR(0, 0, width, height, Radius.circular(50.0)), paint);
    canvas.drawRect(Rect.fromLTRB(0, 0, width/2, height), paint);
    canvas.drawRect(Rect.fromLTRB(0, 0, width, height/2), paint);

    paint.color = Palette.lightDarkBlueAccent;
    canvas.drawCircle(Offset(width,0), 200.0 - scrollLocation, paint);
  }

  @override
  bool shouldRepaint(ProfileBackground oldDelegate) {
    return scrollLocation != oldDelegate.scrollLocation;
  }
}

class PageLayout extends StatefulWidget {
  PageLayout({Key key, this.title, this.items, this.painter, this.statusColor, this.statusBrightness}) : super(key: key);

  final String title;
  final List<Widget> items;
  final ProfileBackground painter;
  final Color statusColor;
  final Brightness statusBrightness;

  @override
  _PageLayoutState createState() => _PageLayoutState();
}

class _PageLayoutState extends State<PageLayout> {
  ScrollController _controller;
  double scrollOffset = 0;

  void _scrollListener() {
    // print(_controller.offset);
    setState(() {
      scrollOffset = _controller.offset;
    });
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    SchedulerBinding.instance.addPostFrameCallback((_) => _scrollListener());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Palette.lightDarkBlue, Brightness.light);
    return CustomPaint(
      painter: ProfileBackground(scrollOffset),
      child: ListView(
        controller: _controller,
        padding: EdgeInsets.all(25.0),
        children: widget.items,
      ),
    );
  }
}
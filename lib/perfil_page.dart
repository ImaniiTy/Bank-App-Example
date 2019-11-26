import 'package:bankapp/main.dart';
import 'package:flutter/material.dart';

import 'common.dart';

class ProfileBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height/2.3;
    Paint paint = Paint()
      ..color = Palette.lightDarkBlue;
    
    canvas.drawRRect(RRect.fromLTRBR(0, 0, width, height, Radius.circular(50.0)), paint);
    canvas.drawRect(Rect.fromLTRB(0, 0, width/2, height), paint);
    canvas.drawRect(Rect.fromLTRB(0, 0, width, height/2), paint);

    paint.color = Palette.lightDarkBlueAccent;
    canvas.drawCircle(Offset(width,0), 200.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class Badge extends StatelessWidget {
  Badge({this.iconImage});

  final Image iconImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0)
      ),
      child: iconImage,
    );
  }
}

class BadgeList extends StatelessWidget {
  BadgeList({this.badges});

  final List<Badge> badges;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: double.infinity,
      height: 80.0,
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Row(
        // scrollDirection: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: badges,
      ),
    );
  }
}

class ProfileInfoCard extends StatelessWidget {
  ProfileInfoCard({this.name, this.email, this.profilePic, this.isVerified: true});

  final Image profilePic;
  final String name;
  final String email;
  final bool isVerified;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330.0,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 20.0),
      decoration: BoxDecoration(
        color: Palette.bWhite,
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: 110,
            height: 110,
            margin: EdgeInsets.only(top: 40.0, bottom: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: Colors.grey[50],
                width: 2.0
              ),
              color: Colors.grey[300]
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                name,
                style: TextStyle(
                  color: Palette.darkBlue,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Icon(Icons.verified_user, color: Colors.yellow,)
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              email,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          BadgeList(
            badges: <Badge>[
              Badge(iconImage:Image.asset("assets/badges/001-first-place.png")),
              Badge(iconImage:Image.asset("assets/badges/006-gold-medal.png")),
              Badge(iconImage:Image.asset("assets/badges/009-winner.png")),
              Badge(iconImage:Image.asset("assets/badges/014-reward.png")),
            ],
          )
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  ProfilePage({Key key, this.title}) : super(key: key);
  final String title;

  Widget _buildList() {
    return ListView(
      padding: EdgeInsets.all(25.0),
      children: <Widget>[
        Container(
          height: 70.0,
          width: double.infinity,
          margin: EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Profile",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit, color: Colors.white, size: 30.0)
              )
            ],
          ),
        ),
        ProfileInfoCard(
          name: "Ricardo Joseph",
          email: "ricardojoseph@gmail.com",
        ),
        Text(
          "General",
          style: TextStyle(fontSize: 20.0),
        ),
        CustomCard(
          onTap: () {
            //TODO
          },
          iconData: Icons.settings,
          iconColor: Palette.lightDarkBlue,
          title: "Profile Settings",
          subTitle: "Update and modify your profile",
          iconBackground: Colors.blueGrey[100],
          sufix: Icon(Icons.chevron_right),
        ),
        CustomCard(
          onTap: () {
            //TODO
          },
          iconData: Icons.security,
          iconColor: Palette.lightDarkBlue,
          title: "Privacy",
          subTitle: "Change your password",
          iconBackground: Colors.blueGrey[100],
          sufix: Icon(Icons.chevron_right),
        ),
        CustomCard(
          onTap: () {
            //TODO
          },
          iconData: Icons.notifications,
          iconColor: Palette.lightDarkBlue,
          title: "Notifications",
          subTitle: "Change your notification settings",
          iconBackground: Colors.blueGrey[100],
          sufix: Icon(Icons.chevron_right),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Palette.lightDarkBlue, Brightness.light);
    return CustomPaint(
      painter: ProfileBackground(),
      child: _buildList(),
    );
  }
}

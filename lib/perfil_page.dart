import 'package:bankapp/main.dart';
import 'package:flutter/material.dart';

import 'common.dart';

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
    return InfoCard(
      height: 330.0,
      margin: EdgeInsets.symmetric(vertical: 20.0),
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
  ProfilePage({Key key}) : super(key: key);

  final List<Widget> _items = [
    Header(
      title: Text(
        "Profile",
        style: TextStyle(
          color: Colors.white,
          fontSize: 26.0,
        ),
      ),
      icon: Icon(Icons.edit, color: Colors.white, size: 30.0),
      onPressed: () {},
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
    Text(
      "Wallet",
      style: TextStyle(fontSize: 20.0),
    ),
      CustomCard(
      onTap: () {
        //TODO
      },
      iconData: Icons.credit_card,
      iconColor: Palette.lightDarkBlue,
      title: "Manage Credit Cards",
      subTitle: "Add or remove a credit card",
      iconBackground: Colors.blueGrey[100],
      sufix: Icon(Icons.chevron_right),
    ),
      CustomCard(
      onTap: () {
        //TODO
      },
      iconData: Icons.monetization_on,
      iconColor: Palette.lightDarkBlue,
      title: "Transactions",
      subTitle: "Manage your transactions",
      iconBackground: Colors.blueGrey[100],
      sufix: Icon(Icons.chevron_right),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      key: key,
      title: "Profile Page",
      painter: ProfileBackground(0),
      statusColor: Palette.lightDarkBlue,
      statusBrightness: Brightness.light,
      items: _items,
    );
  }
}

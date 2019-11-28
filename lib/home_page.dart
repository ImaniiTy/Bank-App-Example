import 'dart:math';
import 'package:intl/intl.dart';

import 'package:bankapp/common.dart';
import 'package:bankapp/main.dart';
import 'package:bankapp/perfil_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BudgetChart extends CustomPainter {
  BudgetChart({this.percentage, this.strokeWidth});

  double percentage;
  double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = size.width;
    double start = pi - pi / 6;
    double end = (pi + pi / 3);
    Paint line = Paint()
      ..color = Palette.blueGrey
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    Paint complete = Paint()
      ..color = Palette.lightDarkBlue
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawArc(
        Rect.fromCenter(center: center, width: radius, height: radius),
        start,
        end,
        false,
        line);

    canvas.drawArc(
        Rect.fromCenter(center: center, width: radius, height: radius),
        start,
        end * percentage,
        false,
        complete);
  }

  @override
  bool shouldRepaint(BudgetChart oldDelegate) {
    return percentage != oldDelegate.percentage;
  }
}

class BudgetCard extends StatelessWidget {
  BudgetCard({Key key, this.budget, this.spent, this.onPressed}) : super(key: key);
  
  final NumberFormat numberFormat = NumberFormat("#,##0", "en_US");
  final int budget;
  final int spent;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    double percentage = spent / budget;
    return InfoCard(
      height: 390.0,
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: 15.0, bottom: 35.0, left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text.rich(TextSpan(
                    text: "for ",
                    style: TextStyle(
                        color: Palette.lightGrey,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: "Axess Platinum ",
                          style: TextStyle(color: Palette.darkBlue)),
                      TextSpan(text: "Card")
                    ])),
                Text.rich(TextSpan(
                    text: "Add Budget",
                    recognizer: TapGestureRecognizer()
                      ..onTap = onPressed, //TODO
                    style: TextStyle(
                        color: Palette.lightDarkBlue,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold)))
              ],
            ),
          ),
          CustomPaint(
            painter: BudgetChart(percentage: percentage, strokeWidth: 18.0),
            child: Container(
              width: 300,
              height: 300,
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Icon(Icons.credit_card,
                      color: Palette.lightDarkBlue, size: 40.0),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "You Are Spent",
                    style: TextStyle(
                        color: Palette.lightGrey,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "\$${numberFormat.format(spent)}",
                    style: TextStyle(
                        color: Palette.darkBlue,
                        fontSize: 45.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text.rich(TextSpan(
                      text: "of ",
                      style: TextStyle(
                        color: Palette.lightGrey,
                        fontSize: 16.0,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "\$${numberFormat.format(budget)}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ]))
                ],
              ),
            ),
          ),
          Container(
            transform: Matrix4.translationValues(0.0, -55.0, 0.0),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "0%",
                    style: TextStyle(
                      color: Palette.lightGrey,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    "100%",
                    style: TextStyle(
                      color: Palette.lightGrey,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class BudgetCard extends StatefulWidget {
//   final NumberFormat numberFormat = NumberFormat("#,##0", "en_US");
//   @override
//   _BudgetCardState createState() => _BudgetCardState();
// }

// class _BudgetCardState extends State<BudgetCard> {
//   // _BudgetCardState({this.budget, this.spent});

//   double percentage;
//   int budget = 6390;
//   int spent = 2248;



//   @override
//   Widget build(BuildContext context) {
//     percentage = spent / budget;
//     return InfoCard(
//       height: 390.0,
//       margin: EdgeInsets.symmetric(vertical: 20.0),
//       child: Column(
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.only(
//                 top: 15.0, bottom: 35.0, left: 20.0, right: 20.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text.rich(TextSpan(
//                     text: "for ",
//                     style: TextStyle(
//                         color: Palette.lightGrey,
//                         fontSize: 15.0,
//                         fontWeight: FontWeight.bold),
//                     children: <TextSpan>[
//                       TextSpan(
//                           text: "Axess Platinum ",
//                           style: TextStyle(color: Palette.darkBlue)),
//                       TextSpan(text: "Card")
//                     ])),
//                 Text.rich(TextSpan(
//                     text: "Add Budget",
//                     recognizer: TapGestureRecognizer()
//                       ..onTap = () {
//                         setState(() {
//                           budget += 500;
//                         });
//                       }, //TODO
//                     style: TextStyle(
//                         color: Palette.lightDarkBlue,
//                         fontSize: 15.0,
//                         fontWeight: FontWeight.bold)))
//               ],
//             ),
//           ),
//           CustomPaint(
//             painter: BudgetChart(percentage: percentage, strokeWidth: 18.0),
//             child: Container(
//               width: 300,
//               height: 300,
//               padding: EdgeInsets.symmetric(vertical: 30.0),
//               child: Column(
//                 children: <Widget>[
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Icon(Icons.credit_card,
//                       color: Palette.lightDarkBlue, size: 40.0),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   Text(
//                     "You Are Spent",
//                     style: TextStyle(
//                         color: Palette.lightGrey,
//                         fontSize: 16.0,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 8.0,
//                   ),
//                   Text(
//                     "\$${widget.numberFormat.format(spent)}",
//                     style: TextStyle(
//                         color: Palette.darkBlue,
//                         fontSize: 45.0,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 8.0,
//                   ),
//                   Text.rich(TextSpan(
//                       text: "of ",
//                       style: TextStyle(
//                         color: Palette.lightGrey,
//                         fontSize: 16.0,
//                       ),
//                       children: <TextSpan>[
//                         TextSpan(
//                           text: "\$${widget.numberFormat.format(budget)}",
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         )
//                       ]))
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             transform: Matrix4.translationValues(0.0, -55.0, 0.0),
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 40.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Text(
//                     "0%",
//                     style: TextStyle(
//                       color: Palette.lightGrey,
//                       fontSize: 16.0,
//                     ),
//                   ),
//                   Text(
//                     "100%",
//                     style: TextStyle(
//                       color: Palette.lightGrey,
//                       fontSize: 16.0,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class SimpleFlatButtom extends StatelessWidget {
  SimpleFlatButtom(
      {this.iconData,
      this.iconSize,
      this.iconColor,
      this.text,
      this.textsize,
      this.textColor,
      this.textDisabledColor,
      this.backgroundColor,
      this.focusColor,
      this.width,
      this.height,
      this.onPressed,
      this.alignment,
      this.padding,
      this.margin});

  final IconData iconData;
  final double iconSize;
  final Color iconColor;
  final String text;
  final double textsize;
  final Color textColor;
  final Color textDisabledColor;
  final Color backgroundColor;
  final Color focusColor;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final MainAxisAlignment alignment;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: margin ?? EdgeInsets.all(0.0),
        child: FlatButton(
          padding: padding ?? EdgeInsets.all(13.0),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: alignment ?? MainAxisAlignment.start,
            children: <Widget>[
              iconData != null
                  ? Icon(
                      iconData,
                      size: iconSize,
                      color: iconColor,
                    )
                  : Container(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: textsize,
                    color: onPressed != null ? textColor : textDisabledColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
          color: backgroundColor,
          disabledColor: focusColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      )
    );
  }
}

class TransactionData {
  TransactionData(this.title, this.count);

  final String title;
  final int count;
}

class TransactionsList extends StatefulWidget {
  TransactionsList({this.labels});

  final List<TransactionData> labels;

  @override
  _TransactionsListState createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  int _selectedIndex = 0;

  List<Widget> _buildButtomList() {
    return List.generate(widget.labels.length, (index) {
      return SimpleFlatButtom(
        onPressed: _selectedIndex == index ? null : () => _updateIndex(index),
        text: widget.labels[index].title,
        textColor: Palette.lightGrey,
        textDisabledColor: Palette.mainBlue,
        focusColor: Palette.blueGrey,
        alignment: MainAxisAlignment.center,
        padding: EdgeInsets.symmetric(vertical: 11.0),
      );
    });
  }

  void _updateIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.labels[_selectedIndex].count);
    return Column(
      children: <Widget>[
        Row(
          children: _buildButtomList(),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: List.generate(widget.labels[_selectedIndex].count, (index) {
            return CustomCard(
              onTap: () {},
              title: "Amazon",
              subTitle: "17 Mondey June",
              iconData: Icons.shopping_cart,
              iconColor: Palette.bWhite,
              iconBackground: Palette.lightGreen,
            );
          }),
        ),
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _budget = 6390;
  int _spent = 2248;

  List<Widget> _buildItems() {
    return <Widget>[
      Header(
        title: Text(
          "Your Budgets",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26.0,
          ),
        ),
        icon: Icon(Icons.notifications, color: Colors.white, size: 30.0),
        onPressed: () {},
      ),
      BudgetCard(
        budget: _budget,
        spent: _spent,
        onPressed: () {
          setState(() {
            _budget += 1000;
          });
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SimpleFlatButtom(
            backgroundColor: Palette.blueGrey,
            text: "Send Money",
            iconData: Icons.swap_horizontal_circle,
            onPressed: () {
              setState(() {
                _spent += 500;
              });
            },
            iconSize: 35.0,
            iconColor: Palette.lightDarkBlue,
            textsize: 16.0,
            textColor: Palette.mainBlue,
            margin: EdgeInsets.only(right: 5.0),
          ),
          SimpleFlatButtom(
            backgroundColor: Palette.blueGrey,
            text: "Calculation",
            iconData: Icons.dialpad,
            onPressed: () {},
            iconSize: 30.0,
            iconColor: Palette.lightDarkBlue,
            textsize: 16.0,
            textColor: Palette.mainBlue,
            margin: EdgeInsets.only(left: 5.0),
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 13.0),
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        child: Text(
          "Transactions",
          style: TextStyle(
            color: Palette.darkBlue,
            fontSize: 25.0,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      TransactionsList(
        labels: <TransactionData>[
          TransactionData("Day", 5),
          TransactionData("Week", 10),
          TransactionData("Month", 15),
          TransactionData("Year", 20),
        ],
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      key: widget.key,
      title: "Home Page",
      // painter: ProfileBackground(0.0),
      statusColor: Palette.lightDarkBlue,
      statusBrightness: Brightness.light,
      items: _buildItems(),
    );
  }
}

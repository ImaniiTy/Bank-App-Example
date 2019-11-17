import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AppBarItem {
  AppBarItem({this.iconData, this.label});
  final IconData iconData;
  final String label;
}

class MainPage extends StatefulWidget {
  MainPage({this.items, this.onTabSelected, this.height: 80.0});

  final List<AppBarItem> items;
  final ValueChanged<int> onTabSelected;
  final double height;
  
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildNavigationItem(AppBarItem info, int index, ValueChanged<int> onTap) {
      var color = index == _selectedIndex ? Colors.blue : Colors.grey;
      return Expanded(
        child: SizedBox(
          height: widget.height,
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () => onTap(index),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(info.iconData, color: color,),
                  Text(info.label,
                    style: TextStyle(color: color),
                  )
                ],
              ) 
            ),
          ),
        ),
      );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
      ),
    );
  }

  Widget _buildFloatingButton() {
    return Container(
      height: 65,
      width: 65,
      transform: Matrix4.translationValues(0.0, 8.0, 0.0),
      child: FloatingActionButton(
        onPressed: () {
          //TODO
        },
        child: Icon(Icons.add),
        elevation: 0.0,
        highlightElevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
          side: BorderSide(
            color: Colors.white,
            width: 4.0,
            style: BorderStyle.solid
          )
        ),
      )
    );
  }

  Widget _buildNavigationBar() {
    List<Widget> items = List.generate(widget.items.length, (index) {
      return _buildNavigationItem(widget.items[index], index, _updateIndex);
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 28.0)]
      ),
      child: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: items,
        ),
        color: Colors.grey[100],
        // shape: CircularNotchedRectangle()
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Center(
          child: Text("Placeholder"), //TODO
        ),
        floatingActionButton: _buildFloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: _buildNavigationBar(),
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:rsl_app/modules/home_screen.dart';

import '../shared/constant_resources/assets_resources.dart';
import '../widgets/drawer.dart';


class bottomNavigationBar extends StatefulWidget {

  @override
  State<bottomNavigationBar> createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade200,
      drawer: commonDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Image.asset(AssetResources.appLogo,width: MediaQuery.of(context).size.width/2,fit: BoxFit.contain,), // Replace 'assets/your_logo.png' with your actual logo image path
              onPressed: () {
                // Action when logo is pressed
                print('Logo pressed');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black12,
        padding: EdgeInsets.zero,
        height: 60,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home,color:  _selectedIndex == 0 ? Colors.black : Colors.grey.shade400),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Icon(Icons.accessible_rounded, color: _selectedIndex == 1 ? Colors.black : Colors.grey.shade400,),
              onPressed: () => _onItemTapped(1),
            ),
            IconButton(
              icon: Icon(Icons.account_box,color: _selectedIndex == 2 ? Colors.black : Colors.grey.shade400,),
              onPressed: () => _onItemTapped(2),
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}

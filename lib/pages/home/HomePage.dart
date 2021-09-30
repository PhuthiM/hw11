import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hw11/pages/home/ProfilePage.dart';

import 'FoodPage.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _subPageIndex = 0;
  int num = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _subPageIndex == 0
            ? Text(
                'Food',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )
            : Text(
                'Profile',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  // ไล่เฉดจากมุมบนซ้ายไปมุมล่างขวาของ Container
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  // ไล่เฉดจากสีแดงไปสีน้ำเงิน
                  colors: [
                    Colors.amberAccent,
                    Colors.amber.shade800,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40.0),
                    child: Container(
                      width: 80.0,
                      height: 80.0,
                      child: Image.asset('assets/images/profile1.jpg'),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Phuthita Sookhong',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'sookhong_p@silpakorn.edu',
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListTile(
              title: _buildDrawerItem(
                  num == 0
                      ? Icon(
                          Icons.fastfood,
                          color: Colors.amber.shade800,
                        )
                      : Icon(Icons.fastfood),
                  'Food',
                  0),
              selected: num == 0,
              onTap: () => _showSubPage(0),
            ),
            ListTile(
              title: _buildDrawerItem(
                  num == 1
                      ? Icon(
                          Icons.person,
                          color: Colors.amber.shade800,
                        )
                      : Icon(Icons.person),
                  'Profile',
                  1),
              selected: num == 1,
              onTap: () => _showSubPage(1),
            ),
          ],
        ),
      ),
      body: Container(
        child: _buildSubPage(),
      ),
    );
  }

  _showSubPage(int index) {
    setState(() {
      _subPageIndex = index;
      num = _subPageIndex;
    });
    Navigator.of(context).pop();
  }

  Widget _buildSubPage() {
    switch (_subPageIndex) {
      case 0: // home page
        return FoodPage();
      case 1:
        return ProfilePage();
      default:
        return SizedBox.shrink();
    }
  }

  Row _buildDrawerItem(Widget icon, String title, int num) {
    return Row(
      children: [
        icon,
        SizedBox(width: 8.0),
        Text(title),
      ],
    );
  }
}

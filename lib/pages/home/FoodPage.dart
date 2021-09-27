import 'package:flutter/material.dart';
import 'package:hw11/pages/home/FoodListPage.dart';
import 'package:hw11/pages/home/OrderPage.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  var _selectedBottomNavIndex = 0;

  Widget _buildSubPage() {
    switch (_selectedBottomNavIndex) {
      case 0: // home page
        return FoodListPage();
      case 1:
        return OrderPage();
      default:
        return SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Your Order',
          ),
        ],
        currentIndex: _selectedBottomNavIndex,
        onTap: _onItemTap,
      ),
      body: Center(
        child: _buildSubPage(),
      ),
    );
  }

  void _onItemTap(index) {
    setState(() {
      _selectedBottomNavIndex = index;
    });
  }

}

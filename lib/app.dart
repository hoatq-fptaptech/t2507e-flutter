import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t2507e_flutter/provider/cart_provider.dart';
import 'package:t2507e_flutter/screens/cart.dart';
import 'package:t2507e_flutter/screens/home.dart';
import 'package:t2507e_flutter/screens/profile.dart';
import 'package:t2507e_flutter/screens/search.dart';

class App extends StatefulWidget{
  const App({super.key});
  @override
  State<StatefulWidget> createState() => _AppState();
}
class _AppState extends State<App>{
  final List<Widget> screen = [
    const Home(),
    const Search(),
    const Cart(),
    const Profile()
  ];
  int _currentScreen = 0;
  // thay dodoir giá trị cho biến _currentScreen
  changeCurrentScreen(int index){
    setState(() {
      _currentScreen = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final cartCount = context.watch<CartProvider>().count;
    return Scaffold(
      appBar: AppBar(
        title: const Text("T2507E Flutter Demo",
          style: TextStyle(color: Colors.white) ),
        backgroundColor: Colors.orange,
      ),
      body: screen[_currentScreen],
      bottomNavigationBar: BottomNavigationBar(
        items:  [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined),label: "Search"),
          BottomNavigationBarItem(
              icon: cartCount > 0
                  ? Badge(
                      label: Text('$cartCount'),
                      child: const Icon(Icons.shopping_bag_outlined),
                    )
                  :const Icon(Icons.shopping_bag_outlined),
              label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: "Profile")
        ],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black87,
        currentIndex: _currentScreen,
        onTap: (index)=>changeCurrentScreen(index),

      ),
    );
  }
}
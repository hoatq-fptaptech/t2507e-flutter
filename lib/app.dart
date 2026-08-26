import 'package:flutter/material.dart';
import 'package:t2507e_flutter/screens/home.dart';

class App extends StatefulWidget{
  const App({super.key});
  @override
  State<StatefulWidget> createState() => _AppState();
}
class _AppState extends State<App>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("T2507E Flutter Demo",
          style: TextStyle(color: Colors.white) ),
        backgroundColor: Colors.orange,
      ),
      body: const Home(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined),label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: "Profile")
        ],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black87,

      ),
    );
  }
}
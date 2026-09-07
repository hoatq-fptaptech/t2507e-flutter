import 'package:flutter/cupertino.dart';
import 'package:t2507e_flutter/screens/home/category_list.dart';
import 'package:t2507e_flutter/screens/home/slider.dart';

class Home extends StatelessWidget{
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Slider(),
          CategoryList()
        ],
      ),
    );
  }
}
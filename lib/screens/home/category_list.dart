import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:t2507e_flutter/models/category_model.dart';

class CategoryList extends StatefulWidget{
  const CategoryList({super.key});
  @override
  State<StatefulWidget> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList>{
  List<Category> cats = [];
  Future<void> getCategories() async{
    try{
      final _dio = Dio(BaseOptions(baseUrl: "https://dummyjson.com"));
      final rs = await _dio.get("/products/categories");
      final data = rs.data as List;
      setState(() {
        cats = data.map((json)=> Category.fromJson(json)).toList();
      });
    }on DioException catch(e){

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10, top:10,right:10,bottom: 20),
          child: Text("Category",
            style: TextStyle(
                color: Colors.red,
                fontSize: 25.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
          height: 200,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cats.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Image.network("https://openweathermap.org/img/wn/10d@2x.png",
                          width: 150, height: 120),
                      Text(cats[index].name??"")
                    ],
                  ),
                );
              }
          ),
        )
      ],
    );
  }
}
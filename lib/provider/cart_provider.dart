import 'package:flutter/material.dart';
import 'package:t2507e_flutter/models/category_model.dart';

class CartProvider extends ChangeNotifier{
  final List<Category> _items = [];
  String _jwtToken = "";

  List<Category> get items => _items;
  int get count => _items.length;
  String get jwt => _jwtToken;
  void setJwtToken(String token){
    _jwtToken = token;
    // notifyListeners();
  }
  double get subtotal {
    return 1500.0;
  }

  void addCategory(Category cat){
    _items.add(cat);
    notifyListeners();
  }
  void removeCategory(Category cat){
    _items.remove(cat);
    notifyListeners();
  }
  void cleanCart(){
    _items.clear();
    notifyListeners();
  }
}
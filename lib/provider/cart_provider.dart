import 'package:flutter/material.dart';
import 'package:t2507e_flutter/models/category_model.dart';

class CartProvider extends ChangeNotifier{
  final List<Category> _items = [];

  List<Category> get items => _items;
  int get count => _items.length;

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
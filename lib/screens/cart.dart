import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t2507e_flutter/provider/cart_provider.dart';

class Cart extends StatelessWidget{
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    return Padding(
        padding: EdgeInsets.all(20),
      child: Column(
        children: [
          const Text("Cart",style: TextStyle(fontSize: 30)),
          Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.all(15),
                  itemCount: cart.count,
                  separatorBuilder: (context,index)=>const SizedBox(height: 12),
                  itemBuilder: (context,index){
                    final item = cart.items[index];
                    return Row(
                      children: [
                        Text('${item.name}',style: TextStyle(fontSize: 18)),
                        IconButton(
                            onPressed: (){
                              cart.removeCategory(item);
                            },
                            icon: Icon(Icons.remove_circle_outline))
                      ],
                    );
                  }
                  
                  
              )
          ),
        ],
      ),
    );
  }
}
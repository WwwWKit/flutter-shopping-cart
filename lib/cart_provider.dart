import 'package:flutter/material.dart';
import 'item.dart';

//State manager
class CartProvider extends ChangeNotifier{
  //Shared data
  final List<Item> itemList = [];

  void add(Item item){
    itemList.add(item);
    notifyListeners(); //Inform all consumers to update UI
  }

  void remove(Item item){
    itemList.remove(item);
    notifyListeners();
  }
}
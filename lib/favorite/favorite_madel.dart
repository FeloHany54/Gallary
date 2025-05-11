import 'package:flutter/material.dart';
import 'package:flutter_task_1/add_item/item.dart';

class FavoriteMadel extends ChangeNotifier {
  final List<Item> _fav = [];
  List<Item> get fav => _fav;

  add(Item item) {
    _fav.add(item);
    notifyListeners();
  }

  remave(Item item) {
    _fav.remove(item);
    notifyListeners();
  }
}

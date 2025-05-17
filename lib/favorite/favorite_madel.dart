import 'package:flutter/material.dart';
import 'package:flutter_task_1/add_item/item.dart';

class FavoriteMadel extends ChangeNotifier {
  final List<Item> _fav = [];
  List<Item> get fav => _fav;

  add(Item item) {
    if (!_fav.contains(item)) {
      _fav.add(item);
    }
    notifyListeners();
  }

  remove(Item item) {
    if (_fav.contains(item)) {
      _fav.remove(item);
    }

    notifyListeners();
  }

  isFavourite(Item item) {
    item.favorite = !item.favorite;
    item.favorite ? add(item) : remove(item);
    notifyListeners();
  }
}

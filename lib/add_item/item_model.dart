import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_task_1/add_item/item.dart';
import 'package:image_picker/image_picker.dart';

class ItemModel extends ChangeNotifier {
  final List<Item> _items = [];
  List<Item> get items => _items;

  void AddItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  ImagePicker imagePicker = ImagePicker();

  List<File>? selectedimage = [];

  Future<void> imageSelector() async {
    List<XFile> images = await imagePicker.pickMultiImage();
    if (images != null) {
      selectedimage!.addAll(
        images.map((toElement) => File(toElement!.path)).toList(),
      );
      // selectedimage = File(image.path);
    }
    notifyListeners();
  }

  @override
  void RemoveImage(index) {
    selectedimage!.removeAt(index);
    notifyListeners();
  }

  Item? _selectedItem;
  Item? get selectedItem => _selectedItem;

  void selectItem(Item item) {
    _selectedItem = item;
    notifyListeners();
  }
}

import 'dart:io';

import 'package:flutter/material.dart';

class Item extends ChangeNotifier {
  Item({
    required this.images,
    required this.title,
    required this.body,
    required this.favorite,
  });

  List<File> images;
  String title;
  String body;
  bool favorite;
}

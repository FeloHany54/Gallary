import 'package:flutter/material.dart';
import 'package:flutter_task_1/add_item/item_model.dart';
import 'package:flutter_task_1/favorite/favorite_madel.dart';
import 'package:provider/provider.dart';

class MyWidget extends StatelessWidget {
  // make love icon stateful to be interact
  const MyWidget({required this.index, super.key});

  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemModel>(
      builder:
          (context, item, child) => IconButton(
            onPressed: () {
              Provider.of<FavoriteMadel>(
                context,
                listen: false,
              ).isFavourite(item.items[index]);
            },
            icon: Icon(
              Icons.favorite,
              color: item.items[index].favorite ? Colors.red : Colors.grey,
            ),
          ),
    );
  }
}

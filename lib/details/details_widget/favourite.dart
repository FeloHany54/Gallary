import 'package:flutter/material.dart';
import 'package:flutter_task_1/add_item/item_model.dart';
import 'package:provider/provider.dart';

class MyWidget extends StatefulWidget {
  // make love icon stateful to be interact
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool click = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemModel>(
      builder:
          (context, item, child) => IconButton(
            onPressed: () {
              setState(() {
                click = !click; //change bool to change color
              });
            },
            icon: Icon(Icons.favorite, color: click ? Colors.red : Colors.grey),
          ),
    );
  }
}

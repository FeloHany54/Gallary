import 'package:flutter/material.dart';

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
    return IconButton(
      onPressed: () {
        setState(() {
          click = !click; //change bool to change color
        });
      },
      icon: Icon(Icons.favorite, color: click ? Colors.red : Colors.grey),
    );
  }
}

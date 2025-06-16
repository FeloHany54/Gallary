import 'package:flutter/material.dart';
import 'package:flutter_task_1/add_item/item_model.dart';
import 'package:flutter_task_1/dashboard/nav_bar.dart';
import 'package:flutter_task_1/favorite/favorite_madel.dart';
import 'package:flutter_task_1/profile/profile_widget/user_Model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserModel()),
        ChangeNotifierProvider(create: (context) => ItemModel()),
        ChangeNotifierProvider(create: (context) => FavoriteMadel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: NavBar(),
    );
  }
}

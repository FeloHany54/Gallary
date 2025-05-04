import 'package:flutter/material.dart';
import 'package:flutter_task_1/first_screen.dart';
import 'package:flutter_task_1/home/home_widget/favourite.dart';
import 'package:flutter_task_1/home/home_widget/season.dart';
import 'package:flutter_task_1/profile/profile_page/profile_page.dart';

class MyHomePage extends StatelessWidget {
  final String? title;
  final String? body;
  const MyHomePage({this.title, this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Screen
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            icon: Icon(Icons.account_box),
          ),
        ],
        centerTitle: true,
        title: Text("The ${title ?? "Treee"}"),
      ), // الappbar الشريط الي فوق بيبقا فيه العنوان

      body: SingleChildScrollView(
        // make scroll to page to be flixable
        child: Column(
          children: [
            Image.asset("Assets/Tree.png"),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.end, // to make icons appear at the end
              children: [
                MyWidget(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                ), // share icon
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0), // يبعد عن اطراف الشاشة
              child: Text(
                textAlign: TextAlign.justify, // make text symmetric متناسق
                body ?? "Felo Hany Khalaf Fahim ",
              ),
            ),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, // بيساوي المسافات بين ال ايتمز
              children: [
                MySeason(
                  // called class (myseason)
                  "Assets/Spring.jpeg",
                  "Spring",
                ),
                MySeason("Assets/Fall.jpeg", "Fall"), // called class (myseason)
              ],
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        // Add button
        onPressed: () {
          Navigator.push(
            // make ma back to first screen
            context,
            MaterialPageRoute(builder: (context) => FirstScreen()),
          );
        },
        child: Icon(Icons.next_plan), // back icon
      ),
    );
  }
}

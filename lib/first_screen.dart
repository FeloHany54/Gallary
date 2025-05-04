import 'package:flutter/material.dart';
import 'package:flutter_task_1/home/home_screen/home_page.dart';

class FirstScreen extends StatefulWidget {
  // stateful to interaction
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController title =
      TextEditingController(); // variable to save input text

  TextEditingController body =
      TextEditingController(); // variable to save input text

  @override
  void dispose() {
    // to remove data when i back to first screen
    title.dispose();
    body.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // disappear appbar
      appBar: AppBar(backgroundColor: Colors.transparent),

      body: Container(
        // Background
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover, // make image fill background
            image: AssetImage("Assets/back2.jpg"),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 150),
            Padding(
              // يبعد عن اطراف الشاشة
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                //space to write
                controller:
                    title, // controller to save data after leaving the screen
                decoration: InputDecoration(
                  hintText: "Title",
                  border: OutlineInputBorder(), // تحديد لمكان الكتابة
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller:
                    body, // controller to save data after leaving the screen
                minLines: 3,
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: "Body",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => MyHomePage(
                    title: title.text,
                    body: body.text,
                  ), // defined this variable to print title & body in homepage
            ),
          );
        },
      ),
    );
  }
}

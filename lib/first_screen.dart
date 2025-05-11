import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_task_1/home/home_screen/home_page.dart';
import 'package:image_picker/image_picker.dart';

class FirstScreen extends StatefulWidget {
  // stateful to interaction
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  ImagePicker imagePicker = ImagePicker();

  List<File>? selectedimage = [];

  Future<void> imageSelector() async {
    List<XFile> images = await imagePicker.pickMultiImage();
    if (images != null && mounted) {
      setState(() {
        selectedimage!.addAll(
          images.map((toElement) => File(toElement!.path)).toList(),
        );
        // selectedimage = File(image.path);
      });
    }
  }

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
        child: ListView(
          children: [
            SizedBox(height: 30),

            selectedimage!.isEmpty
                ? Container(
                  color: Colors.white38,
                  height: 150,
                  width: MediaQuery.sizeOf(context).width - 20,
                  child: IconButton(
                    onPressed: () {
                      imageSelector();
                    },
                    icon: Icon(Icons.camera_alt),
                  ),
                )
                : Row(
                  children: [
                    Container(
                      color: Colors.white38,
                      height: 100,
                      width: 100,
                      child: IconButton(
                        onPressed: () {
                          imageSelector();
                        },
                        icon: Icon(Icons.camera_alt),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        width: MediaQuery.sizeOf(context).width - 20,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children:
                              selectedimage!
                                  .map(
                                    (toElement) => Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                          ),
                                          child: Image.file(
                                            toElement,
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              selectedimage!.removeAt(
                                                selectedimage!.indexOf(
                                                  toElement,
                                                ),
                                              );
                                            });
                                          },
                                          icon: Icon(Icons.cancel),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                        ),
                      ),
                    ),
                  ],
                ),

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
                    image: selectedimage,
                  ), // defined this variable to print title & body in homepage
            ),
          );
        },
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ImagePicker imagePicker = ImagePicker();

  File? selectedimage;

  Future<void> imageSelector(ImageSource source) async {
    XFile? image = await imagePicker.pickImage(source: source);
    if (image != null && mounted) {
      setState(() {
        selectedimage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")), // title of page

      body: Column(
        children: [
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  //for profile image
                  backgroundColor: Colors.grey.shade500,
                  radius: 100,

                  child:
                      selectedimage == null
                          ? Icon(color: Colors.white38, Icons.person, size: 200)
                          : ClipOval(
                            child: Image.file(
                              height: 200,
                              width: 200,
                              fit: BoxFit.cover,
                              selectedimage!,
                            ),
                          ),
                ),
                CircleAvatar(
                  // for camera buttom
                  backgroundColor: Colors.black,
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder:
                            (context) => SizedBox(
                              height: 150,
                              child: Column(
                                children: [
                                  Text(
                                    "Profile",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Options(
                                        onpressed: () {
                                          imageSelector(ImageSource.camera);
                                          Navigator.pop(context);
                                        },
                                        title: "Camera",
                                        icon: Icons.camera_alt,
                                      ),
                                      Options(
                                        onpressed: () {
                                          imageSelector(ImageSource.gallery);
                                          Navigator.pop(context);
                                        },
                                        title: "Gallery",
                                        icon: Icons.image,
                                      ),
                                      if (selectedimage != null)
                                        Options(
                                          selectedimage: selectedimage,
                                          onpressed: () {
                                            if (mounted) {
                                              setState(() {
                                                selectedimage = null;
                                              });
                                            }
                                            Navigator.pop(context);
                                          },
                                          title: "Delete",
                                          icon: Icons.delete,
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ), // whem press apear white sheet
                      );
                    },
                    icon: Icon(
                      color: Colors.white38,
                      Icons.camera_alt,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Options extends StatelessWidget {
  final String title;
  final IconData icon;
  final File? selectedimage;
  final VoidCallback onpressed;
  final Colors? color;
  const Options({
    this.selectedimage,
    this.color,
    required this.onpressed,
    required this.title,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          color: selectedimage == null ? Colors.grey : Colors.red,
          onPressed: onpressed,
          icon: Icon(icon),
        ),
        Text(
          title,
          style: TextStyle(
            color:
                selectedimage == null ? Colors.grey.shade500 : Colors.redAccent,
          ),
        ),
      ],
    );
  }
}

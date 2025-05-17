import 'dart:io';
import 'package:flutter_task_1/add_item/item.dart';
import 'package:flutter_task_1/add_item/item_model.dart';
import 'package:flutter_task_1/profile/profile_widget/user_Model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_1/add_item/add_item_screen.dart';
import 'package:flutter_task_1/details/details_widget/favourite.dart';
import 'package:flutter_task_1/details/details_widget/season.dart';
import 'package:flutter_task_1/profile/profile_page/profile_page.dart';

class DetailsPage extends StatelessWidget {
  // final String? title;
  // final String? body;
  // final List<File>? image;
  const DetailsPage({
    // this.image, this.title, this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final profileImage = Provider.of<UserModel>(context).user?.image;
    final items = Provider.of<ItemModel>(context);
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
            icon:
                profileImage == null
                    ? Icon(Icons.account_box)
                    : CircleAvatar(
                      child: ClipOval(
                        child: Image.file(
                          profileImage,
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
          ),
        ],
        centerTitle: true,
        title: Text("The ${items.selectedItem!.title}"),
      ), // الappbar الشريط الي فوق بيبقا فيه العنوان

      body: ListView(
        children: [
          Column(
            children: [
              // image == null || image!.isEmpty
              //     ? Image.asset("Assets/Tree.png")
              //     :
              Image.file(
                items.selectedItem!.images.first,
                height: 300,
                fit: BoxFit.cover,
                width: double.infinity,
              ),

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.end, // to make icons appear at the end
                children: [
                  MyWidget(
                    index: items.items.indexOf(items.selectedimage! as Item),
                  ),
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
                  items.selectedItem!.body,
                  // ?? "Felo Hany Khalaf Fahim ",
                ),
              ),

              // image == null || image!.isEmpty
              //     ? Row(
              //       mainAxisAlignment:
              //           MainAxisAlignment
              //               .spaceEvenly, // بيساوي المسافات بين ال ايتمز
              //       children: [
              //         MySeason(
              //           // called class (myseason)
              //           "Assets/Spring.jpeg",
              //           "Spring",
              //         ),
              //         MySeason(
              //           "Assets/Fall.jpeg",
              //           "Fall",
              //         ), // called class (myseason)
              //       ],
              //     )
              //:
              SizedBox(
                height: 500,
                child: GridView.builder(
                  itemCount: items.selectedItem!.images!.length,
                  itemBuilder:
                      (context, index) => Image.file(
                        items.selectedItem!.images[index],
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        // Add button
        onPressed: () {
          Navigator.push(
            // make ma back to first screen
            context,
            MaterialPageRoute(builder: (context) => AddItemScreen()),
          );
        },
        child: Icon(Icons.next_plan), // back icon
      ),
    );
  }
}

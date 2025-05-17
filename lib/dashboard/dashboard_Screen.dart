import 'package:flutter/material.dart';
import 'package:flutter_task_1/add_item/item.dart';
import 'package:flutter_task_1/add_item/item_model.dart';
import 'package:flutter_task_1/details/details_screen/details_page.dart';
import 'package:flutter_task_1/add_item/add_item_screen.dart';
import 'package:flutter_task_1/details/details_widget/favourite.dart';
import 'package:flutter_task_1/favorite/favorite_madel.dart';
import 'package:flutter_task_1/profile/profile_page/profile_page.dart';
import 'package:flutter_task_1/profile/profile_widget/user_Model.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileImage = Provider.of<UserModel>(context).user?.image;
    final items = Provider.of<ItemModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("DashBoard"),
        centerTitle: true,
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
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2 /*make Grid 2 Column*/,
          crossAxisSpacing: 10,
        ),

        itemCount: items.items.length,
        itemBuilder: (context, index) {
          return InkWell(
            // make the thing inside it as buttom
            onTap: () {
              items.selectItem(
                Item(
                  images: items.items[index].images,
                  title: items.items[index].title,
                  body: items.items[index].body,
                  favorite: items.items[index].favorite,
                ),
              );

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsPage()),
              );
            },
            child: SizedBox(
              child: Column(
                children: [
                  Image.file(
                    items.items[index].images.first,
                    height: 125,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(items.items[index].title),
                      MyWidget(index: items.items.indexOf(items.items[index])),
                      // IconButton(
                      //   onPressed: () {
                      //     Provider.of<FavoriteMadel>(
                      //       context,
                      //       listen: false,
                      //     ).add(items.items[index]);
                      //   },
                      //   icon: Icon(Icons.favorite),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddItemScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

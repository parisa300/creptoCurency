import 'package:creptoapp/src/comment/data/modelComment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/commentController.dart';

class CommentScreen extends StatelessWidget {
  CommentController commentController = Get.put(CommentController());

  CommentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    commentController.setComment();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return _buildAllItem();
          },
        ),
      ),
    );
  }

  Widget _buildAllItem() {
    return Obx((){
     return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),
            height: 10,
            width: Get.width,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(8)),
                  _circleAvatar(),
                  const SizedBox(width: 8),
                  _buildName(),
                ],
              ),
              _Icon(Icons.more_vert),
            ],
          ),
          _commentAndImage(),
          _like(),
        ],
      );
    });
  }

  Widget _buildName() {
    return Text(
      "text",
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      // maxLines: 1,
      // overflow: TextOverflow.ellipsis,
    );
  }

  Widget _Icon(IconData icon) {
    return IconButton(
      onPressed: () {},
      icon: Icon(icon),
    );
  }

  Widget _like() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.all(8)),
              _Icon(Icons.favorite),
              const SizedBox(width: 8),
              _buildName(),
            ],
          ),
          _buildName(),
        ],
      ),
    );
  }

  Widget _commentAndImage() {
    return Column(
      children: [
        Text("this is a comment"),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey,
          ),
          height: 140,
          width: 350,
          child: Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSGp3Y94iesxHcVSXSe7Y3dsjEUvYG5pOD1ftxBj1o0OEEXp9Md9lCI8gVKfrHsNxAEzQ&usqp=CAU",
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _circleAvatar() {
    return const CircleAvatar(
      backgroundImage:
          NetworkImage("https://g.foolcdn.com/art/companylogos/square/btc.png"),
      radius: 25.0,
      backgroundColor: Colors.transparent,
    );
  }
}

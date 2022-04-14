import 'package:creptoapp/src/comment/data/modelComment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentListItem extends StatelessWidget {
  final ModelComment item;

  const CommentListItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildProfile(),
          SizedBox(
            height: 8,
          ),
          _buildDescreption(),
          SizedBox(
            height: 8,
          ),
          _buildImage(),
          _like(),
        ],
      ),
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

  Widget _Icon(IconData icon) {
    return IconButton(
      onPressed: () {},
      icon: Icon(icon),
    );
  }

  Widget _like() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  _Icon(Icons.favorite),
                  // const SizedBox(width: 8),
                  _buildName(),
                ],
              ),
            ),
          ],
        ),
        Text(
          item.email.toString(),
          overflow: TextOverflow.fade,
        ),
      ],
    );
  }

  Widget _buildName() {
    return  Flexible(
      child: Text(
        item.name.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        // maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
  Widget _buildNameProfile() {
    return  Flexible(
      child: Text(
        item.name.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        // maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildImage() {
    return Container(
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
    );
  }

  Widget _buildProfile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              _circleAvatar(),
              const SizedBox(width: 8),
              _buildNameProfile(),

            ],
          ),
        ),
        _Icon(Icons.more_vert)
      ],
    );
  }

  Widget _buildDescreption() {
    return Row(
      children: [
        Flexible(
            child: Text(
          item.body.toString(),
          overflow: TextOverflow.fade,
        )),
      ],
    );
  }
}

import 'package:creptoapp/src/comment/data/modelComment.dart';
import 'package:creptoapp/src/comment/ui/comment_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/commentController.dart';

class CommentScreen extends StatelessWidget {
  CommentController commentControl = Get.put(CommentController());

  CommentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // commentControl.getAllComment();
    return SafeArea(
      child: Scaffold(
          // backgroundColor:
          //     Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
          body: _buildAllItem()),
    );
  }

  Widget _buildAllItem() {
    return Obx(() {
      if (commentControl.loadng.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return ListView.separated(
          padding: EdgeInsets.all(16),
          itemCount: commentControl.comment.length,
          itemBuilder: (context, index) {
            ModelComment item = commentControl.comment[index];
            return CommentListItem(item: item);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 16,
              color: Colors.transparent,
            );
          },
        );
        // ListView.builder(
        //   itemCount: commentControl.comment.length,
        //   itemBuilder: (context, index) {
        //     ModelComment comment = commentControl.comment[index];
        //     return Column(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Container(
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(4),
        //             color: Colors.white,
        //           ),
        //           height: 10,
        //           width: Get.width,
        //         ),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Row(
        //               children: [
        //                 Padding(padding: EdgeInsets.all(8)),
        //                 _circleAvatar(),
        //                 const SizedBox(width: 8),
        //                 _buildName(comment),
        //               ],
        //             ),
        //             _Icon(Icons.more_vert),
        //           ],
        //         ),
        //         _commentAndImage(comment),
        //         _like(comment),
        //       ],
        //     );
        //   },
        // );*/
      }
    });
  }
}

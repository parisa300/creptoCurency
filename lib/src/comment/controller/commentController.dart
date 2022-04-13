import 'package:creptoapp/src/comment/data/modelComment.dart';
import 'package:get/get.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
class CommentController extends GetxController{
  RxBool loadng = true.obs;
  RxList<ModelComment> comment = <ModelComment>[].obs;

  setComment() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/comments");

    var response = await http.get(url);
   // comment.clear();
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      jsonResponse['data'].forEach((element) {
        comment.add(ModelComment.fromJson(element));
      });
    } else {}
    loadng.value = false;
  }
}
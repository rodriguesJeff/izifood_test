import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:izifood/app/controllers/keys.dart';
import 'package:izifood/app/models/comment_model.dart';
import 'package:meta/meta.dart';

class RequestComment {
  final http;
  RequestComment({@required this.http});

  getComments() async {
    try {
      var prefs = await SharedPreferences.getInstance();
      var postId = prefs.getInt('postId').toString();
      var response = await http.get(baseUrl + '/comments?postId=' + postId);
      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);
        List<CommentModel> listComment = jsonResponse
            .map((comment) => CommentModel.fromJson(comment))
            .toList();
        return listComment;
      } else {
        print('erro');
      }
    } catch (e) {
      return Exception(e);
    }
  }
}

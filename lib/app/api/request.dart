import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:izifood/app/controllers/keys.dart';
import 'package:meta/meta.dart';
import 'package:izifood/app/models/post_model.dart';

class Request {
  final http;
  Request({@required this.http});

  getPosts() async {
    try {
      var response = await http.get(baseUrl + '/posts');
      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);
        List<PostModel> listPosts =
            jsonResponse.map((post) => PostModel.fromJson(post)).toList();
        return listPosts;
      } else {
        print('erro');
      }
    } catch (e) {
      Exception(e);
    }
  }
}

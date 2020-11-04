import 'package:izifood/app/models/post_model.dart';
import 'package:dio/dio.dart';

import '../controllers/keys.dart';

class PostRepository {
  Dio dio = Dio();
  Future<List<PostModel>> getPosts() async {
    try {
      var response = await dio.get(baseUrl + '/posts');

      if (response.statusCode == 200) {
        return List<PostModel>.from(
            response.data.map((post) => PostModel.fromJson(post)));
      } else {
        return List<PostModel>();
      }
    } catch (error) {
      print(error);
      return List<PostModel>();
    }
  }
}

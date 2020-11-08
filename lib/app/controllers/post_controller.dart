import 'package:get/get.dart';
import 'package:izifood/app/models/post_model.dart';
import 'package:izifood/app/repositories/post_repository.dart';
import 'package:meta/meta.dart';

class PostController extends GetxController {
  final PostRepository repository;
  PostController({@required this.repository}) : assert(repository != null);

  final _postList = List<PostModel>().obs;
  get postList => this._postList;
  set postList(value) => this._postList.value = value;

  getPosts() {
    repository.getPosts().then((data) {
      this.postList = data;
    });
  }
}

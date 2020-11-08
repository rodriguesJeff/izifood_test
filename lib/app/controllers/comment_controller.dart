import 'package:get/get.dart';

import 'package:izifood/app/models/comment_model.dart';
import 'package:izifood/app/repositories/comment_repository.dart';
import 'package:meta/meta.dart';

class CommentController extends GetxController {
  final CommentRepository repository;
  CommentController({@required this.repository}) : assert(repository != null);

  final _commentList = List<CommentModel>().obs;
  get commentList => this._commentList.value;
  set commentList(value) => this.commentList.value = value;

  getComments() {
    repository.getComments().then((data) {
      this.commentList = data;
    });
  }
}

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:izifood/app/api/request_comment.dart';
import 'package:izifood/app/controllers/comment_controller.dart';
import 'package:izifood/app/repositories/comment_repository.dart';

class CommentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommentController>(() {
      return CommentController(
          repository: CommentRepository(
              requestComment: RequestComment(http: http.Client())));
    });
  }
}

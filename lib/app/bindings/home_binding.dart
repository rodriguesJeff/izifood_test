import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:izifood/app/api/request.dart';
import 'package:izifood/app/controllers/post_controller.dart';
import 'package:izifood/app/repositories/post_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostController>(() {
      return PostController(
          repository: PostRepository(api: Request(http: http.Client())));
    });
  }
}

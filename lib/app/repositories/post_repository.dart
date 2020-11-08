import 'package:izifood/app/api/request_post.dart';
import 'package:meta/meta.dart';

class PostRepository {
  final RequestPost requestPost;

  PostRepository({@required this.requestPost}) : assert(requestPost != null);

  getPosts() {
    return requestPost.getPosts();
  }
}

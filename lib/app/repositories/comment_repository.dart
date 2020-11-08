import 'package:izifood/app/api/request_comment.dart';
import 'package:meta/meta.dart';

class CommentRepository {
  final RequestComment requestComment;

  CommentRepository({@required this.requestComment})
      : assert(requestComment != null);

  getComments() {
    return requestComment.getComments();
  }
}

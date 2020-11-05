import 'package:flutter/material.dart';
import 'package:izifood/app/api/request.dart';
import 'package:meta/meta.dart';

class PostRepository {
  final Request api;

  PostRepository({@required this.api}) : assert(api != null);

  getPosts() {
    return api.getPosts();
  }
}

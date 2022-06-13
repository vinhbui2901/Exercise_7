import 'package:flutter_exercise_8/repository/repository.dart';

import '../model/comment.dart';

class CommentController {
  final Repository _repository;

  CommentController(this._repository);
  Future<List<Comment>> fetchCommentList() async {
    return _repository.getComment();
  }

  Future<bool> updateCommentList(Comment comment) async {
    return _repository.putComment(comment);
  }

  Future<bool> createCommentList(Comment comment) async {
    return _repository.postComment(comment);
  }

  Future<bool> deleteCommentList(Comment comment) async {
    return _repository.deletelComment(comment);
  }
}

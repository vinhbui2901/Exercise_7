import 'package:flutter_exercise_8/model/comment.dart';

abstract class Repository {
  Future<List<Comment>> getComment();

  Future<bool> postComment(Comment comment);

  Future<bool> putComment(Comment comment);

  Future<bool> deletelComment(Comment comment);
}

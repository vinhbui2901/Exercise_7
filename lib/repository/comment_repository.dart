// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter_exercise_8/model/comment.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_exercise_8/repository/repository.dart';

class CommentRepository implements Repository {
  String Url = 'https://jsonplaceholder.typicode.com';
  @override
  Future<bool> deletelComment(Comment comment) async {
    var url = Uri.parse('$Url/comments/${comment.id}');
    print(' delete id: ${comment.toJson()}');
    var response = await http.delete(url);
    print('deletel statusCode: ${response.statusCode}');
    print(response.body);
    return true;
  }

  @override
  Future<List<Comment>> getComment() async {
    List<Comment> dataList = [];
    var url = Uri.parse('$Url/comments');
    var response = await http.get(url);
    print('Get statusCode: ${response.statusCode}');
    var body = json.decode(response.body);
    for (int i = 0; i < body.length; i++) {
      dataList.add(Comment.fromJson(body[i]));
    }
    return dataList;
  }

  @override
  Future<bool> postComment(Comment comment) async {
    var url = Uri.parse('$Url/comments');
    print(comment.toJson());
    var response = await http.post(url, body: comment.toJson());
    print('create statusCode: ${response.statusCode}');

    print(response.body);
    return true;
  }

  @override
  Future<bool> putComment(Comment comment) async {
    var url = Uri.parse('$Url/comments/${comment.id}');
    print(comment.toJson());
    var response = await http.put(url, body: comment.toJson());
    print('update statusCode: ${response.statusCode}');
    print(response.body);
    return true;
  }
}

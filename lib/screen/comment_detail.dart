// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_exercise_8/model/comment.dart';

class ListDetail extends StatelessWidget {
  const ListDetail({Key? key, required this.comment}) : super(key: key);
  final Comment comment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('detail'),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Text('PostId: ${comment.postId}'),
              Text('Id: ${comment.id}'),
              Text('Name: ${comment.name}'),
              Text('Email: ${comment.email}'),
              Flexible(child: Text('body: ${comment.body}')),
            ],
          ),
        ),
      ),
    );
  }
}

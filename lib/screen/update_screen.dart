// ignore_for_file: avoid_unnecessary_containers, unnecessary_new, unused_import, prefer_const_constructors_in_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exercise_8/controller/comment_controller.dart';
import 'package:flutter_exercise_8/model/comment.dart';
import 'package:flutter_exercise_8/repository/comment_repository.dart';

class Update extends StatefulWidget {
  Update({Key? key, required this.comment}) : super(key: key);
  final Comment comment;
  @override
  State<Update> createState() => _UpdateState();
}

var _comment_controller = CommentController(CommentRepository());

final TextEditingController _nameController = new TextEditingController();

final TextEditingController _emailController = new TextEditingController();

final TextEditingController _bodyController = new TextEditingController();

class _UpdateState extends State<Update> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Comment'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('PostId: ${widget.comment.postId}'),
            Text('Id: ${widget.comment.id}'),
            const Text('Name: '),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.blue),
                  hintText: "Enter your name"),
            ),
            const SizedBox(height: 20),
            const Text('Email: '),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.blue),
                  hintText: "Enter your Email"),
            ),
            const SizedBox(height: 20),
            const Text('body: '),
            TextField(
              controller: _bodyController,
              decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.blue),
                  hintText: "Enter your body"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text("update"),
              onPressed: () {
                Comment a = Comment(
                    postId: widget.comment.postId,
                    id: widget.comment.id,
                    name: _nameController.text,
                    email: _emailController.text,
                    body: _bodyController.text);
                _comment_controller.updateCommentList(a);
                const SnackBar(
                  content: Text('Update successfully'),
                  duration: Duration(seconds: 5),
                  backgroundColor: Colors.blue,
                  behavior: SnackBarBehavior.floating,
                  elevation: 10,
                );
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

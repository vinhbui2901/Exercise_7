// ignore_for_file: avoid_unnecessary_containers, unnecessary_new, unused_import, prefer_const_constructors_in_immutables, non_constant_identifier_names, unnecessary_import, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exercise_8/controller/comment_controller.dart';
import 'package:flutter_exercise_8/model/comment.dart';
import 'package:flutter_exercise_8/repository/comment_repository.dart';

class Create extends StatelessWidget {
  Create({Key? key}) : super(key: key);

  var _comment_controller = CommentController(CommentRepository());
  final TextEditingController _postIdController = new TextEditingController();
  final TextEditingController _nameController = new TextEditingController();

  final TextEditingController _idController = new TextEditingController();

  final TextEditingController _emailController = new TextEditingController();

  final TextEditingController _bodyController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Create Comment'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('PostId: '),
              TextField(
                keyboardType: TextInputType.number,
                controller: _postIdController,
                decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.blue),
                    hintText: "Enter your Post Id"),
              ),
              const Text('Id:'),
              TextField(
                keyboardType: TextInputType.number,
                controller: _idController,
                decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.blue),
                    hintText: "Enter your Id"),
              ),
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
                child: const Text("Create"),
                onPressed: () {
                  Comment a = Comment(
                      postId: int.parse(_postIdController.text),
                      id: int.parse(_idController.text),
                      name: _nameController.text,
                      email: _emailController.text,
                      body: _bodyController.text);
                  _comment_controller.createCommentList(a);

                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SnackBar(
                          content: Text('create successfully'),
                          duration: Duration(seconds: 5),
                          backgroundColor: Colors.blue,
                          behavior: SnackBarBehavior.floating,
                          elevation: 10,
                        ),
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

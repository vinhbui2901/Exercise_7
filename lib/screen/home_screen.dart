// ignore_for_file: prefer_final_fields, avoid_print, non_constant_identifier_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_exercise_8/controller/comment_controller.dart';
import 'package:flutter_exercise_8/model/comment.dart';
import 'package:flutter_exercise_8/repository/comment_repository.dart';
import 'package:flutter_exercise_8/screen/comment_detail.dart';
import 'package:flutter_exercise_8/screen/create_screen.dart';
import 'package:flutter_exercise_8/screen/update_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _comment_controller = CommentController(CommentRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(),
            FutureBuilder<List<Comment>>(
                future: _comment_controller.fetchCommentList(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Center(child: Text('error'));
                  }
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        var comment = snapshot.data?[index];
                        return GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 239, 230, 204),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        Text('${comment?.id}'),
                                        Text('${comment?.name}'),
                                        Text('${comment?.email}')
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Update(
                                                          comment: snapshot
                                                              .data![index],
                                                        )));
                                          },
                                          icon: const Icon(Icons.edit),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                      title:
                                                          const Text('Notice'),
                                                      content: Text(
                                                          'You definitely want to delete Item: ${comment?.id}'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                              'Cancel'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            _comment_controller
                                                                .deleteCommentList(
                                                                    snapshot.data![
                                                                        index]);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child:
                                                              const Text('Ok'),
                                                        )
                                                      ],
                                                    ));
                                          },
                                          icon: const Icon(Icons.delete),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListDetail(
                                        comment: snapshot.data![index])));
                          },
                        );
                      });
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Create()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

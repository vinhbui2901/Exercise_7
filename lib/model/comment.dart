// ignore_for_file: unnecessary_this, prefer_collection_literals, unnecessary_new

class Comment {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  Comment(
      {required this.postId,
      required this.id,
      required this.name,
      required this.email,
      required this.body});

  Comment.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId.toString();
    data['id'] = this.id.toString();
    data['name'] = this.name;
    data['email'] = this.email;
    data['body'] = this.body;
    return data;
  }
}

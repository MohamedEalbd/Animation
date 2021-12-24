// To parse this JSON data, do
//
//     final postVm = postVmFromJson(jsonString);

import 'dart:convert';

List<PostVm> postVmFromJson(String str) => List<PostVm>.from(json.decode(str).map((x) => PostVm.fromJson(x)));

String postVmToJson(List<PostVm> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostVm {
  PostVm({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory PostVm.fromJson(Map<String, dynamic> json) => PostVm(
    userId: json["userId"] == null ? null : json["userId"],
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    body: json["body"] == null ? null : json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId == null ? null : userId,
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "body": body == null ? null : body,
  };
}

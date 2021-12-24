
import 'dart:convert';
import 'package:flutter_animation/model/post.dart';
import 'package:http/http.dart' as http;

class ApiLogic{
  static Future<List<PostVm>> getAllPosts() async {
    var response = await http.get('https://jsonplaceholder.typicode.com/posts',
        headers: {"Content-Type": "application/json"});
    // print(response.body[0]);
    // print(utf8.decode(response.bodyBytes));
    List data = JsonDecoder().convert(utf8.decode(response.bodyBytes));
    print(data[0]['university']);
    return data.map((e) => PostVm.fromJson(e)).toList();
  }
}
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc_sm/models/comments_model.dart';

class CommentsRepositary {
  final dio = Dio();
  Future<List<CommentsModel>> fetchComments() async {
    try {
      final response =
          await dio.get("https://jsonplaceholder.typicode.com/comments");
      if (response.statusCode == 200) {
        final body = response.data as List;
        return body
            .map((e) => CommentsModel(
                postId: e['postId'],
                id: e['id'],
                name: e['name'],
                email: e['email'],
                body: e['body']))
            .toList();
      }
    } on SocketException {
      throw Exception("Network issue");
    }
    throw Exception("error");
  }
}

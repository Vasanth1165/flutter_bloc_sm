// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_sm/models/comments_model.dart';
import 'package:flutter_bloc_sm/utills/enums.dart';

class CommentsState extends Equatable {
  final List<CommentsModel> comments;
  final List<CommentsModel> searchComments;
  final String message;
  final FetchCommentsStatus status;
  final String searchMess;
  final String search;
  const CommentsState(
      {this.message = "",
      this.status = FetchCommentsStatus.loading,
      this.comments = const <CommentsModel>[],
      this.searchComments = const <CommentsModel>[],
      this.searchMess = "",
      this.search =""});

  CommentsState copyWith(
      {List<CommentsModel>? comments,
      String? message,
      FetchCommentsStatus? status,
      List<CommentsModel>? searchComments,
      String? searchMess,
      String? search}) {
    return CommentsState(
        comments: comments ?? this.comments,
        message: message ?? this.message,
        status: status ?? this.status,
        searchComments: searchComments ?? this.searchComments,
        searchMess: searchMess ?? this.searchMess,
        search: search ?? this.search
        );
  }

  @override
  List<Object> get props =>
      [comments, message, status, searchComments, searchMess,search];
}

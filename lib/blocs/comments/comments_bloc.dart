import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_sm/blocs/comments/comments_event.dart';
import 'package:flutter_bloc_sm/blocs/comments/comments_state.dart';
import 'package:flutter_bloc_sm/repositories/comments_repository.dart';
import 'package:flutter_bloc_sm/utills/enums.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final commentsRepositary = CommentsRepositary();

  CommentsBloc() : super(const CommentsState()) {
    on<FetchCommentsEvent>(_fetchCommnets);
    on<SearchCommentsEvent>(_searchCommnets);
  }

  void _fetchCommnets(
      FetchCommentsEvent event, Emitter<CommentsState> emit) async {
    await commentsRepositary.fetchComments().then((value) {
      emit(state.copyWith(
          comments: value,
          status: FetchCommentsStatus.success,
          message: "Success"));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          status: FetchCommentsStatus.failure, message: error.toString()));
    });
  }

  void _searchCommnets(SearchCommentsEvent event, Emitter<CommentsState> emit) {
    if (event.search.isEmpty) {
      emit(state.copyWith(searchMess: ""));
    } else {
      final searchComments = state.comments
          .where((e) =>
              e.id.toString().contains(event.search.toString()) ||
              e.email.toString().contains(event.search.toString()))
          .toList();
      if (searchComments.isNotEmpty) {
        emit(state.copyWith(
            searchComments: searchComments,
            searchMess: "",
            search: event.search));
      } else {
        emit(state.copyWith(
            searchMess: "Search Data not found", search: event.search));
      }
    }
  }
}

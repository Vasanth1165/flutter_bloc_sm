import 'package:equatable/equatable.dart';

class CommentsEvent extends Equatable {
  const CommentsEvent();

  @override
  List<Object> get props => [];
}

class FetchCommentsEvent extends CommentsEvent {}

class SearchCommentsEvent extends CommentsEvent {
  final String search;
  const SearchCommentsEvent({required this.search});
}

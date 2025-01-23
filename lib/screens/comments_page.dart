import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sm/blocs/comments/comments_bloc.dart';
import 'package:flutter_bloc_sm/blocs/comments/comments_event.dart';
import 'package:flutter_bloc_sm/blocs/comments/comments_state.dart';
import 'package:flutter_bloc_sm/utills/enums.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  void initState() {
    super.initState();
    context.read<CommentsBloc>().add(FetchCommentsEvent());
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Build");
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: BlocBuilder<CommentsBloc, CommentsState>(
          buildWhen: (previous, current) => previous.props != current.props,
          builder: (context, state) {
            debugPrint("blocs");
            if (state.status == FetchCommentsStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.status == FetchCommentsStatus.failure) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: TextFormField(
                      onChanged: (val) {
                        context
                            .read<CommentsBloc>()
                            .add(SearchCommentsEvent(search: val));
                      },
                      decoration: const InputDecoration(
                          hintText: "Search by email or id",
                          border: OutlineInputBorder()),
                    ),
                  ),
                  state.searchMess.isNotEmpty
                      ? Expanded(
                          child: Center(
                            child: Text(state.searchMess),
                          ),
                        )
                      : state.search.isEmpty
                          ? Expanded(
                              child: ListView.separated(
                                padding: const EdgeInsets.all(8),
                                itemCount: state.comments.length,
                                itemBuilder: (context, index) {
                                  final comment = state.comments[index];

                                  return ExpansionTile(
                                    tilePadding: const EdgeInsets.all(0),
                                    childrenPadding: const EdgeInsets.all(0),
                                    leading: Text("${comment.id}",
                                        textAlign: TextAlign.center),
                                    title: Text("${comment.name}"),
                                    subtitle: Text("${comment.email}"),
                                    children: [
                                      Text(
                                        "${comment.body}",
                                        style: const TextStyle(),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const SizedBox(
                                  height: 8,
                                ),
                              ),
                            )
                          : Expanded(
                              child: ListView.separated(
                                padding: const EdgeInsets.all(8),
                                itemCount: state.searchComments.length,
                                itemBuilder: (context, index) {
                                  final comment = state.searchComments[index];
                                  return ExpansionTile(
                                    tilePadding: const EdgeInsets.all(0),
                                    childrenPadding: const EdgeInsets.all(0),
                                    leading: Text("${comment.id}",
                                        textAlign: TextAlign.center),
                                    title: Text("${comment.name}"),
                                    subtitle: Text("${comment.email}"),
                                    children: [
                                      Text(
                                        "${comment.body}",
                                        style: const TextStyle(),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const SizedBox(
                                  height: 8,
                                ),
                              ),
                            )
                ],
              );
            }
          }),
    );
  }
}

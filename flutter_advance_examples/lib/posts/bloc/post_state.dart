import 'package:flutter_advance_examples/posts/models/post_model.dart';

abstract class PostState {}

class PostLoading extends PostState {
  PostLoading();
}

class PostLoaded extends PostState {
  final List<PostModel> posts;
  PostLoaded({required this.posts});
}

class PostError extends PostState {
  final String error;
  PostError({required this.error});
}

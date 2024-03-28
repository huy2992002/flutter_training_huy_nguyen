import 'package:dio/dio.dart';
import 'package:flutter_advance_examples/posts/api/api_exception.dart';
import 'package:flutter_advance_examples/posts/bloc/post_event.dart';
import 'package:flutter_advance_examples/posts/bloc/post_state.dart';
import 'package:flutter_advance_examples/posts/models/post_model.dart';
import 'package:flutter_advance_examples/posts/repository/post_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostLoading()) {
    on<PostStarted>(fetchPosts);
  }
  final repository = PostRepository();

  Future<void> fetchPosts(PostStarted event, Emitter<PostState> emit) async {
    emit(PostLoading());
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      List<PostModel> posts = await repository.fetchListPost();
      emit(PostLoaded(posts: posts));
    } catch (e) {
      if (e is DioException) {
        emit(PostError(error: ApiException.getExceptionMessage(e)));
      } else {
        emit(PostError(error: e.toString()));
      }
    }
  }
}

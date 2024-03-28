import 'package:flutter/material.dart';
import 'package:flutter_advance_examples/posts/bloc/post_bloc.dart';
import 'package:flutter_advance_examples/posts/bloc/post_event.dart';
import 'package:flutter_advance_examples/posts/bloc/post_state.dart';
import 'package:flutter_advance_examples/posts/models/post_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PostBloc>().add(PostStarted());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
      ),
      body: BlocConsumer<PostBloc, PostState>(
        
        listener: (context, state) {
          if (state is PostError) {
            final snackBar = SnackBar(content: Text(state.error));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          if (state is PostLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {
            return ListView.separated(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                PostModel post = state.posts[index];
                return ListTile(
                  title: Text('${post.id}'),
                  subtitle: Text(post.title ?? ''),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            );
          } else {
            return const Center(child: Text('Error'));
          }
        },
      ),
    );
  }
}

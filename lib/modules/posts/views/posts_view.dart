import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/modules/posts/providers/posts_provider.dart';

class PostsView extends ConsumerWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsListFuture = ref.watch(postsListProvider);

    return Scaffold(
      body: postsListFuture.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 0,
                child: ListTile(
                  title: Text(data[index].title),
                ),
              );
            },
          );
        },
        error: (error, s) => const SizedBox(),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

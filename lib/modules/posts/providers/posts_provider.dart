import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/modules/posts/models/post.dart';
import 'package:riverpod_example/modules/posts/repository/posts_repository.dart';

final postRepositoryProvider = Provider<PostsRepository>((ref) {
  return PostsRepository();
});


final postsListProvider = FutureProvider<List<Post>>((ref) {
  return ref.read(postRepositoryProvider).getPostsFromServer();
});
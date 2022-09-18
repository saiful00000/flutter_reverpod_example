
import 'dart:convert';

import 'package:riverpod_example/constants/api_urls.dart';
import 'package:riverpod_example/helpers/http_helper.dart' as httpHelper;
import 'package:riverpod_example/modules/posts/models/post.dart';

class PostsRepository{
 Future<List<Post>> getPostsFromServer() async {
   final List<Post> postList = [];

   try{
     final response = await httpHelper.get(uri: ApiUrls.postListApi());
     if(response.statusCode == 200){
       for(var json in jsonDecode(response.body)){
         postList.add(Post.fromJson(json));
       }
     }
     return postList;
   }catch(error){
     throw Exception(error);
     return postList;
   }
 }
}
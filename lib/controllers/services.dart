import 'dart:convert';

import 'package:interview/models/post.dart';
import 'package:http/http.dart' as http;
import 'package:interview/models/user.dart';

Future<List<User>> fetchUsers() async {
  Uri usersListAPIUrl =
      Uri.https('jsonplaceholder.typicode.com', '/users', {'q': '{http}'});
  final response = await http.get(usersListAPIUrl);

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((user) => User.fromJson(user)).toList();
  } else {
    throw Exception('Failed to load jobs from API');
  }
}

Future<List<Post>> fetchPosts() async {
  Uri postsListAPIUrl =
      Uri.https('jsonplaceholder.typicode.com', '/posts', {'userId': '2'});
  final response = await http.get(postsListAPIUrl);

  if (response.statusCode == 200) {
    print(response.body);
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((post) => Post.fromJson(post)).toList();
    // return posteses.map((post) => Post.fromJson(post)).toList();
  } else {
    throw Exception('Failed to load posts from API');
  }
}

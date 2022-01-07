import 'dart:convert';

import 'package:interview/models/post.dart';
import 'package:interview/models/user.dart';
import 'package:http/http.dart' as http;

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
  Uri usersListAPIUrl =
      Uri.https('jsonplaceholder.typicode.com', '/posts', {'q': '{https}'});
  final response = await http.get(usersListAPIUrl);

  if (response.statusCode == 200) {
    print(response.body);
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((post) => Post.fromJson(post)).toList();
  } else {
    throw Exception('Failed to load jobs from API');
  }
}

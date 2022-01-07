import 'package:flutter/material.dart';
import 'package:interview/controllers/services.dart';
import 'package:interview/models/post.dart';
import 'package:interview/views/postcard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Post>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Luxoft Interview",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Center(
              child: const Text(
                "User: 2",
                style: const TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: FutureBuilder<List<Post>>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Post>? data = snapshot.data;
                return ListView.builder(
                    itemCount: data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return PostCard(
                        post: data[index],
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default show a loading spinner.
              return const CircularProgressIndicator(
                color: Colors.cyan,
              );
            },
          ),
        ),
      ),
    );
  }
}

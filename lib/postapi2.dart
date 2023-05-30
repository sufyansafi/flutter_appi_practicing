import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_appi_practicing/model/postmodel.dart';//
import 'package:http/http.dart' as http;

class Post {
  final int id;
  final String title;
  final String body;
  final DateTime date;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.date,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      date: DateTime.parse(json['date']),
    );
  }
}

class Postapi2 extends StatefulWidget {
  @override
  _Postapi2State createState() => _Postapi2State();
}

class _Postapi2State extends State<Postapi2> {
  String? date;

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      final List<Post> posts =
          responseData.map((data) => Post.fromJson(data)).toList();
      setState(() {
        date = posts.first.date.toString();
      });
    } else {
      setState(() {
        date = 'Error: ${response.statusCode}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Display'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: fetchData,
              child: Text('Fetch Date'),
            ),
            SizedBox(height: 16),
            Text(
              date ?? 'Press the button to fetch date',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

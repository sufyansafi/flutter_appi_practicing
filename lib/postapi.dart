import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';

class Postapi extends StatefulWidget {
  const Postapi({super.key});

  @override
  State<Postapi> createState() => _PostapiState();
}

// Future<void> createPost() async {
//   const apiUrl = 'https://jsonplaceholder.typicode.com/posts';

//   // Define the headers and body for the POST request
//   final headers = {'Content-Type': 'application/json'};
//   final body = jsonEncode({
//     'title': 'My Post Title',
//     'body': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
//     'userId': 1,
//   });

//   // Make the POST request
//   final response =
//       await http.post(Uri.parse(apiUrl), headers: headers, body: body);

//   // Check the response status code
//   if (response.statusCode == 201) {
//     // Post request successful
//     final responseData = jsonDecode(response.body);
//     print('New post created with ID: ${responseData['id']}');
//   } else {
//     // Post request failed
//     print('Failed to create post. Status code: ${response.statusCode}');
//   }
// }

// Future<void> makePostRequest() async {
//   final response = await http.post(
//     Uri.parse('https://jsonplaceholder.typicode.com/posts'),
//     headers: {'Content-Type': 'application/json'},
//     body: jsonEncode({
//       'title': 'Sample Title',
//       'body': 'Sample Body',
//       'userId': 3,
//     }),
//   );

//   if (response.statusCode == 201) {
//     // Request successful
//     final responseData = jsonDecode(response.body);
//     print(responseData);
//   } else {
//     // Request failed
//     print('Request failed with status: ${response.statusCode}');
//   }
// }

// void makePostRequest() async {
//   final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

//   Map<String, dynamic> requestBody = {
//     'title': 'Example Title',
//     'body': 'Example Body',
//     'userId': 1,
//   };

//   final response = await http.post(url, body: json.encode(requestBody));

//   if (response.statusCode == 201) {
//     print('Post request successful!');
//     print(response.body);
//   } else {
//     print('Error: ${response.statusCode}');
//   }
// }

// final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

// Future<Map<String, dynamic>> createPost() async {
//   final response = await http.post(Uri.parse(apiUrl),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode(<String, String>{
//         'title': 'My Title',
//         'body': 'My Body',
//         'userId': '1',
//       }));

//   if (response.statusCode == 201) {
//     return json.decode(response.body);
//   } else {
//     throw Exception('Failed to create post');
//   }
// }

Future<void> postData() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  final response = await http.post(
    url,
    body: jsonEncode(<String, dynamic>{
      'title': 'are or do repels provide blacked out except option criticizes',
      'body': 'Sample Body',
      'userId': 1,
    }),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 201) {
    print('Post created successfully!');
    print(response.body);
  } else {
    print('Failed to create post. Error code: ${response.statusCode}');
  }
}

class _PostapiState extends State<Postapi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post api"),
      ),
      body: Center(
        child: (FloatingActionButton(
            child: Text("cliked me bro "),
            onPressed: () {
              postData();
            })),
      ),
    );
  }
}

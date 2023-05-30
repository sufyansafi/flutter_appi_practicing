import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Postapi3 extends StatefulWidget {
  const Postapi3({super.key});

  @override
  State<Postapi3> createState() => _Postapi3State();
}

class _Postapi3State extends State<Postapi3> {
  // Future<String> fetchData() async {
  //   final response =
  //       await http.get(Uri.parse('https://reqres.in/api/register'));
  //   if (response.statusCode == 200) {
  //     return response.body;
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  // String data = '';

 Future<Map<String, dynamic>> fetchData() async {
  final response = await http.get(Uri.parse('https://reqres.in/api/register'));
  
  if (response.statusCode == 200) {
    // If the request is successful, parse the JSON response
    final Map<String, dynamic> data = json.decode(response.body);
    return data;
  } else {
    // If the request fails, throw an exception
    throw Exception('Failed to load data');
  }
}

 



  Map<String, dynamic>? _jsonData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                fetchData().then((data) {
                  setState(() {
                    _jsonData = data;
                  });
                }).catchError((error) {
                  print(error);
                });
              },
              child: Text('Fetch Data'),
            ),
            if (_jsonData != null)
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  json.encode(_jsonData),
                  style: TextStyle(fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
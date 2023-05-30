import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Getapikey extends StatefulWidget {
  @override
  _GetapikeyState createState() => _GetapikeyState();
}

class _GetapikeyState extends State<Getapikey> {
  Map<String, dynamic> userData = {};

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users/2'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      setState(() {
        userData = jsonData['data'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Details'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                fetchData();
              },
              child: Text('Fetch Data'),
            ),
            if (userData.isNotEmpty) ...[
              Text('ID: ${userData['id']}'),
              Text('Email: ${userData['email']}'),
              Text('First Name: ${userData['first_name']}'),
              Text('Last Name: ${userData['last_name']}'),
              Image.network(userData['avatar']),
            ],
          ],
        ),
      ),
    );
  }
}

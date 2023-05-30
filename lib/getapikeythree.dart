import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetapikeysingleuseenotFound extends StatefulWidget {
  const GetapikeysingleuseenotFound({super.key});

  @override
  State<GetapikeysingleuseenotFound> createState() =>
      _GetapikeysingleuseenotFoundState();
}

class _GetapikeysingleuseenotFoundState
    extends State<GetapikeysingleuseenotFound> {
  @override
  Map<String, dynamic> userData = {};

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users/23'));
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
          title: Text('User not found'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  fetchData();
                },
                child: Text('Fetch Data'),
              ),
              SizedBox(height: 20),
              Text('ID: ${userData['id'] ?? ''}'),
              Text(
                  'Name: ${userData['first_name'] ?? ''} ${userData['last_name'] ?? ''}'),
              Text('Email: ${userData['email'] ?? ''}'),
              userData.containsKey('avatar')
                  ? Image.network(userData['avatar'])
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

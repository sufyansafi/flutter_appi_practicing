import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Getapirequest extends StatefulWidget {
  const Getapirequest({super.key});

  @override
  State<Getapirequest> createState() => _GetapirequestState();
}

class _GetapirequestState extends State<Getapirequest> {
  List<dynamic> userList = [];

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      setState(() {
        userList = jsonData['data'] ?? []; // Use empty list if data is null
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('User List'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                fetchData();
              },
              child: Text('Fetch Data'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  final user = userList[index];
                  final email =
                      user['email'] ?? ''; // Use empty string if email is null
                  final firstName = user['first_name'] ??
                      ''; // Use empty string if first_name is null
                  final avatarUrl = user['avatar'] ??
                      ''; // Use empty string if avatar is null
                  return ListTile(
                    title: Text(email),
                    subtitle: Text(firstName),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(avatarUrl),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

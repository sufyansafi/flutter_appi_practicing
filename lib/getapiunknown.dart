import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Getuserapiunknown extends StatefulWidget {
  const Getuserapiunknown({super.key});

  @override
  State<Getuserapiunknown> createState() => _GetuserapiunknownState();
}

class _GetuserapiunknownState extends State<Getuserapiunknown> {
  Future<dynamic> fetchData() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/unknown'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Container(
            child: Container(
              color: Colors.white,
              child: FutureBuilder<dynamic>(
                future: fetchData(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text(snapshot.data.toString());
                  }
                },
              ),
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_appi_practicing/getxcontroller/apigetxcontroller.dart';
import 'package:flutter_appi_practicing/model/getapitenuserdatamodel.dart';

import 'package:get/get.dart';


class Getapi10userfakeapi extends StatefulWidget {
  const Getapi10userfakeapi({super.key});

  @override
  _Getapi10userfakeapiState createState() => _Getapi10userfakeapiState();
}

class _Getapi10userfakeapiState extends State<Getapi10userfakeapi> {
  // List<dynamic> _users = [];

  // void _fetchUsers() async {
  //   final response = await http.get(Uri.parse('https://fakestoreapi.com/users'));
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       _users = jsonDecode(response.body);
  //     });
  //   } else {
  //     throw Exception('Failed to fetch users');
  //   }
  // }

  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: Obx(
        () => userController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: userController.users.length,
                itemBuilder: (context, index) {
                  User user = userController.users[index];
                  return ListTile(
                    title: Text(user.username),
                    subtitle: Text(user.email),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userController.fetchUsers();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
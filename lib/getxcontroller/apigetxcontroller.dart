import 'dart:convert';

import 'package:flutter_appi_practicing/model/getapitenuserdatamodel.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';

class UserController extends GetxController {
  var users = <User>[].obs;
  var isLoading = false.obs;

  Future<void> fetchUsers() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('https://fakestoreapi.com/users'));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        users.value = data.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch users');
      }
    } finally {
      isLoading.value = false;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_appi_practicing/Cartapi.dart';
import 'package:flutter_appi_practicing/getapi10user.dart';
import 'package:flutter_appi_practicing/getapikey2.dart';
import 'package:flutter_appi_practicing/getapikeythree.dart';
import 'package:flutter_appi_practicing/getapirequest.dart';
import 'package:flutter_appi_practicing/getapiunknown.dart';
import 'package:get/get.dart';
// import 'package:flutter_appi_practicing/postapi.dart';

import 'getapiofproduct.dart';
import 'postapi2.dart';
import 'postapi3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CartScreen(),
    );
  }
}

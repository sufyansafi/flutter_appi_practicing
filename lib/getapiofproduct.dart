import 'package:flutter/material.dart';
import 'package:flutter_appi_practicing/model/productgetapimodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late Future<List<Product>> _fetchProducts;

  @override
  void initState() {
    super.initState();
    _fetchProducts = fetchProducts();
  }

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Product> products = data.map((json) => Product.fromJson(json)).toList();
      return products;
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: FutureBuilder<List<Product>>(
        future: _fetchProducts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Product>? products = snapshot.data;
            return ListView.builder(
              itemCount: products!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(products[index].image),
                  title: Text(products[index].title),
                  subtitle: Text(products[index].price.toStringAsFixed(2)),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

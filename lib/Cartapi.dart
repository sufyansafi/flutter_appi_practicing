import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//now i creye a model of cart // 

class Cart {
  final int id;
  final int userId;
  final List<CartItem> products;

  Cart({required this.id, required this.userId, required this.products});

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      userId: json['userId'],
      products: List<CartItem>.from(json['products'].map((x) => CartItem.fromJson(x))),
    );
  }
}

class CartItem {
  final int productId;
  final int quantity;

  CartItem({required this.productId, required this.quantity});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }
}
// now i crete a stefull widget to fetch the data of fakr api response cart in our screeen//


class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Future<Cart> _fetchCart;

  @override
  void initState() {
    super.initState();
    _fetchCart = fetchCart();
  }

  Future<Cart> fetchCart() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/carts/1')); // Replace 1 with the desired cart ID
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return Cart.fromJson(data);
    } else {
      throw Exception('Failed to fetch cart');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: FutureBuilder<Cart>(
        future: _fetchCart,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Cart cart = snapshot.data!;
            return ListView.builder(
              itemCount: cart.products.length,
              itemBuilder: (context, index) {
                CartItem cartItem = cart.products[index];
                return ListTile(
                  title: Text('Product ID: ${cartItem.productId}'),
                  subtitle: Text('Quantity: ${cartItem.quantity}'),
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

// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:grocery_app_08_04/Model/model.dart';
import 'package:grocery_app_08_04/ViewModel/viewmodel.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late void _addCart = ViewModel().cartList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Cart Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Card(
          child: Container(
            height: 70,
          ),
          elevation: 10,
        ),
      ),
    );
  }
}

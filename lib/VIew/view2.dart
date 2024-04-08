// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:grocery_app_08_04/Model/model.dart';
import 'package:grocery_app_08_04/ViewModel/viewmodel.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Cart Page'),
      ),
    );
  }
}

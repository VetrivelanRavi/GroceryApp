import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:grocery_app_08_04/Model/model.dart';

class ViewModel {
  ViewModel();
  List cartList = [];

  Future<List<Model>> fetchDetails() async {
    try {
      String jsonString =
          await rootBundle.loadString('lib/assets/grocery.json');

      List<dynamic> jsonData = jsonDecode(jsonString);

      List<Model> model =
          jsonData.map((dynamic item) => Model.fromJson(item)).toList();
      return model;
    } catch (e) {
      throw Exception('Failed To Load Screen:$e');
    }
  }

  void _addCart(Model model) {
    cartList.add(Model());
  }
}

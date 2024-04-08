// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last, prefer_const_literals_to_create_immutables, unnecessary_nullable_for_final_variable_declarations

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery_app_08_04/Model/model.dart';
import 'package:grocery_app_08_04/VIew/view2.dart';
import 'package:grocery_app_08_04/ViewModel/viewmodel.dart';

class Viewpage extends StatefulWidget {
  const Viewpage({super.key});

  @override
  State<Viewpage> createState() => _ViewpageState();
}

class _ViewpageState extends State<Viewpage> {
  late Future<List<Model>> _modelFuture;

  @override
  void initState() {
    super.initState();
    _modelFuture = ViewModel().fetchDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery App'),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              );
            },
            child: IconButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CartPage(),
              )),
              icon: Icon(Icons.shopping_bag_outlined),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _modelFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('error:${snapshot.error}');
          } else {
            final List<Model>? ModelClass = snapshot.data!;
            if (ModelClass != null && ModelClass.isNotEmpty) {
              return ListView.builder(
                itemCount: ModelClass.length,
                itemBuilder: (context, index) {
                  final Model = ModelClass[index];
                  return modelClassBuild(Model);
                },
              );
            } else {
              return Text('No Data Available');
            }
          }
        },
      ),
    );
  }

  Widget modelClassBuild(Model Model) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Card(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.4)),
            height: 295,
            child: Column(
              children: [
                Text(Model.name.toString()),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 150,
                    width: 450,
                    child: Image.network(Model.image.toString())),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Price:${Model.price.toString()}'),
                ),
                Text(Model.category.toString()),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              action: SnackBarAction(
                                  label: 'Undo', onPressed: () {}),
                              duration: Durations.extralong4,
                              content: Center(
                                child: Text(
                                  'Added To Cart Successfully',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          );
                        },
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          elevation: 10,
        ),
      ),
    );
  }
}

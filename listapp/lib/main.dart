import 'package:flutter/material.dart';
import 'package:listapp/routes/appRoutes.dart';
import 'package:listapp/screens/crud.dart';
import 'package:listapp/screens/home.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Lista',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          Routers.HOME: (_) => HomeList(),
          Routers.CRUD: (_) => Crud (),
        });
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listapp/routes/appRoutes.dart';

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Listagem dos dados', style: TextStyle(fontWeight: FontWeight.bold)),
            actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(Routers.CRUD);
            },
          ),
        ]));
  }
}

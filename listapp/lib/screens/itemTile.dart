
// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:listapp/models/item.dart';
import 'package:listapp/routes/appRoutes.dart';

class ItemTile extends StatelessWidget {
  final Item _item;

  const ItemTile(this._item);

  @override
  Widget build(BuildContext context) {

    return new Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: new ListTile(
        leading: new Image.memory(_item.foto!),
        title: Text(_item.titulo!,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
        subtitle: Text(_item.descricao!),
        onTap: () {
          Navigator.of(context).pushNamed(
            Routers.CRUD,
           arguments: _item,
          );
        },
      ),
      decoration: new BoxDecoration(
        border: Border.all(
          color: Colors.blue,
          width: 2,
        ),
      ),
    );
  }
}

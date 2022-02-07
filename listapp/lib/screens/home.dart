import 'package:flutter/material.dart';
import 'package:listapp/data/db.dart';
import 'package:listapp/models/item.dart';
import 'package:listapp/routes/appRoutes.dart';
import 'package:listapp/screens/itemTile.dart';
import 'package:sqflite/sqflite.dart';

class HomeList extends StatefulWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  late List<Item> lista;
  late Database db;
  Item? item;
  late int tamanhoLista = 0;
  
  @override
  void initState() {
    getlistdb();
    super.initState();
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
            title: Text('Listagem dos dados',
                style: TextStyle(fontWeight: FontWeight.bold)),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    Routers.CRUD,
                   arguments: item
                    
                  );
                },
              ),
            ]),
        body: Container(
            child: RefreshIndicator(
          onRefresh: _reloadList,
          child: ListView.builder(
              itemCount: tamanhoLista,
              itemBuilder: (ctx, i) => ItemTile(lista[i])),
        )));
  }


  //recuperando dados no banco de dados
 getlistdb() async {
    db = await DBHelper.instance.database;
    var result = await db.rawQuery("SELECT * FROM lista");
    var mapList = await result;
    int count = mapList.length;
    List<Item> listaAuxiliar = <Item>[];

    for (int i = 0; i < count; i++) {
      listaAuxiliar.add(Item.fromMapObject((result[i])));
    }
    setState(() {
     lista = listaAuxiliar;
      tamanhoLista = listaAuxiliar.length;
    });
  }
//Refresh na lista
  Future<void> _reloadList() async {
    var newList = await Future.delayed(const Duration(seconds: 2), () => getlistdb());
    setState(() {
      lista = newList;
    });
  }

}

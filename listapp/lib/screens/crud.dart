import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:listapp/data/db.dart';
import 'package:listapp/models/item.dart';
import 'package:listapp/routes/appRoutes.dart';
import 'package:sqflite/sqflite.dart';

class Crud extends StatefulWidget {

  const Crud({Key? key}) : super(key: key);

  @override
  _CrudState createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  late Database db;
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  late Uint8List foto;
  int id = 0;
  bool validFoto = false;
  bool update = false;

  void _loadFormData(Item item) {
    late String? titulo = item.titulo;
    late String? descricao = item.descricao;
      _formData['titulo'] = titulo!;
      _formData['descricao'] = descricao!;
   
  }


  @override
  void didChangeDependencies() {
    final item = ModalRoute.of(context)?.settings.arguments as Item?;
    if (item != null) {
      setState(() {
        update = true;
        id = item.id!;
        validFoto = true;
        foto = item.foto!;
      });
      _loadFormData(item);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
           automaticallyImplyLeading: false,
            title: Text('Insira os dados',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            actions: <Widget>[
              Visibility(
                visible: update,
                child: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    apagarItem(id);
                    Navigator.of(context).pushNamed(
                      Routers.HOME,
                    );
                  },
                ),
              )
            ]),
        body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0XFF1E90FF),
                      Color(0xFF87CEFA),
                      Color(0xFFADFF2F),
                    ]),
              ),
              padding:
                  EdgeInsets.only(top: 30, left: 40, right: 40, bottom: 60),
              child: Form(
                  key: _form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 250,
                              alignment: Alignment.center,
                              // ignore: prefer_const_constructors
                              decoration: BoxDecoration(),
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                this._getImage();
                              },
                              elevation: 2.0,
                              fillColor: Colors.blue,
                              // ignore: prefer_const_constructors
                              child: Icon(
                                Icons.add_a_photo,
                                size: 20.0,
                              ),
                              shape: CircleBorder(),
                            ),
                            if (validFoto)
                              new Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: MemoryImage(foto)))),
                            Container(
                              width: 250,
                              child: TextFormField(
                                initialValue: _formData['titulo'],
                                // autofocus: true,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '* Campo obrigatório';
                                  }
                                },
                                onSaved: (value) =>
                                    _formData['titulo'] = value!,
                                decoration: InputDecoration(
                                  labelText: "Titulo",
                                  labelStyle: TextStyle(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                  ),
                                ),
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 250,
                              child: TextFormField(
                                initialValue: _formData['descricao'],
                                // autofocus: true,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '* Campo obrigatório';
                                  }
                                },
                                onSaved: (value) =>
                                    _formData['descricao'] = value!,
                                decoration: InputDecoration(
                                  labelText: "Descrição",
                                  labelStyle: TextStyle(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 250,
                              height: 60,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: [0.3, 1],
                                  colors: [
                                    Color(0xFF00BFFF),
                                    Color(0XFF1E90FF),
                                  ],
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: SizedBox.expand(
                                child: TextButton(
                                  child: (update)
                                      ? Text(
                                          "Atualizar",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      : Text(
                                          "Salvar",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                  onPressed: () {
                                    final isValid =
                                        _form.currentState!.validate();
                                    if (isValid) {
                                      _form.currentState!.save();
                                      if (update) {
                                        atualizarItem(
                                          Item(
                                              id: id,
                                              titulo: _formData['titulo']
                                                  .toString(),
                                              descricao: _formData['descricao']
                                                  .toString(),
                                              foto: foto),
                                        );
                                      } else {
                                        saveItem(Item(
                                            titulo:
                                                _formData['titulo'].toString(),
                                            descricao: _formData['descricao']
                                                .toString(),
                                            foto: foto));
                                      }

                                      Navigator.of(context).pushNamed(
                                        Routers.HOME,
                                      );
                                      //  }
                                    }
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: TextButton(
                                child: Text(
                                  "Cancelar",
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () =>
                                    Navigator.pushNamed(context, Routers.HOME),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ))),
        ));
  }

  Future _getImage() async {

    var image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxHeight: 576,
        maxWidth: 720);
    final file = File(image!.path);
    final fotoBytes = file.readAsBytesSync();
   setState(() {
      foto = fotoBytes;
      validFoto = true;
    });
  }

//Salvar item na lista
  Future<void> saveItem(Item item) async {
  db = await DBHelper.instance.database;
   db.insert("lista", item.toMap());
  }
//apagar item na lista
  Future<void> apagarItem(int id) async {
    db = await DBHelper.instance.database;
    db.rawDelete('DELETE FROM lista WHERE id = $id');

  }
//atualizar item na lista
  Future<void> atualizarItem(Item item) async {
  db = await DBHelper.instance.database;
  await db.update("lista", item.toMap(), where: "id = ?", whereArgs: [item.id]);
  }
}

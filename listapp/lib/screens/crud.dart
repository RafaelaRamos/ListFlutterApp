import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listapp/routes/appRoutes.dart';

class Crud extends StatefulWidget {


  @override
  _CrudState createState() => _CrudState();
}

class _CrudState extends State<Crud> {

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de dados',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
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
                              child: CircleAvatar( 
                                radius: 100,
                                child:Row(
                                  children: <Widget>[
                                   Icon(Icons.person),
                                    SizedBox(
                              height: 10,
                            ),
                               
                                   
                                   ]),
                                
                                   
                                 )),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 250,
                              child: TextFormField(
                                // autofocus: true,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '* Campo obrigatório';
                                  }
                                },
                                onSaved: (value) => _formData['nome'] = value!,
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
                                // autofocus: true,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '* Campo obrigatório';
                                  }
                                },
                                onSaved: (value) => _formData['nome'] = value!,
                                decoration: InputDecoration(
                                  labelText: "Descrição",
                                  labelStyle: TextStyle(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                                style: TextStyle(
                                  fontSize: 20,
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
                                  child: Text(
                                    "Cadastrar",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  onPressed: () {
                                   /* final isValid =
                                        _form.currentState.validate();
                                    if (isValid) {
                                      _form.currentState.save();
                                      Provider.of<ModuloProvider>(context,
                                              listen: false)
                                          .setModulo(
                                              Modulo(
                                                  nome: _formData['nome']
                                                      .toString(),
                                                  idPropriedade:
                                                      widget._idPropriedade),
                                              this.locationList);

                                      Navigator.pop(context);*/
                                  //  }
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
                                onPressed: () => Navigator.pushNamed(
                                    context, Routers.HOME),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ))),
        ));
  }

  
}
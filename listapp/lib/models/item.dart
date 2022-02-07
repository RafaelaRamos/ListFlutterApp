
import 'dart:typed_data';


class Item {
  int? id;
  String? titulo;
  String? descricao;
  Uint8List? foto;
  Item({this.id, this.titulo, this.descricao,
        this.foto
   });


  Map<String, dynamic> toMap() {
  var map = Map<String, dynamic>();
  map['id']=id;
  map['titulo'] = titulo;
  map['descricao'] = descricao;
  map['foto'] = foto;

   return map;
 }
 Item.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.titulo = map['titulo'];
    this.descricao = map['descricao'];
    this.foto = map['foto'];
 }

}

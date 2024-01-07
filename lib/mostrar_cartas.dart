import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'api_helper_cardname.dart';
import 'api_helper_setname.dart';
import 'db_helper.dart';
import 'json_helper.dart';
import 'mtg_card.dart';

class MostrarCartas extends StatefulWidget{
  const MostrarCartas({Key? key, required this.helper}) : super(key: key);

  final db_helper helper;

  @override
  State<MostrarCartas> createState() => _MostrarCartaState();
}

class _MostrarCartaState extends State<MostrarCartas> {
  List<Map<String, dynamic>> listaCartas = [];

  fetchCards() async{
    listaCartas = await widget.helper.getListaCompletaCartas();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mostrar Cartas"),
      ),
        body: ListView.builder(
          itemCount: listaCartas.length,
          itemBuilder: (context, index) {
            return getBody();
          })
    );
  }
  Widget getBody(){
    return ListView.builder(
        itemCount: listaCartas.length,
        itemBuilder: (context, index){

          return getCard(listaCartas[index]);
        });
  }
  Widget getCard(item){
    var name = item['name'];
    var set = item['set_name'];
    return Card(
        child: ListTile(
          title: Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.purple
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                      width: MediaQuery.of(context).size.width-140,
                      child: Text(name,style: TextStyle(fontSize: 17),)),
                  SizedBox(height: 10,),
                  Text(set.toString(),style: TextStyle(color: Colors.grey),)
                ],
              )
            ],
          )
        )
    );
  }
}
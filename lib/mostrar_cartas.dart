import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'api_helper_cardname.dart';
import 'api_helper_setname.dart';
import 'db_helper.dart';
import 'json_helper.dart';
import 'mtg_card.dart';

class MostrarCartas extends StatefulWidget{
  const MostrarCartas({Key? key, required this.helper}) : super(key: key);

  final DbHelper helper;

  @override
  State<MostrarCartas> createState() => _MostrarCartaState();
}

class _MostrarCartaState extends State<MostrarCartas> {
  List<Map<String, dynamic>> listaCartas = [];

  @override
  void initState(){
    super.initState();
    fetchCards();
  }
  fetchCards() async{
    listaCartas = await widget.helper.getListaCompletaCartas();
    setState(() {}); // Trigger a rebuild after fetching data
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
            return getCard(listaCartas[index]);
          },
        ),
    );
  }

  Widget getCard(item) {
    var name = item['name'];
    var set = item['set_name'];
    return Card(
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(name, style: const TextStyle(fontSize: 17)),
            const SizedBox(height: 10),
            Text(set.toString(), style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
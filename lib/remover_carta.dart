import 'package:flutter/material.dart';
import 'package:tg_v1/db_helper.dart';

class RemoverCarta extends StatefulWidget {
  const RemoverCarta({Key? key, required this.helper}) : super(key: key);

  final db_helper helper;

  @override
  _RemoverCartaState createState() => _RemoverCartaState();
}

class _RemoverCartaState extends State<RemoverCarta> {
  final nameController = TextEditingController();
  final setController = TextEditingController();
  final qttController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Remover Carta"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campo de Texto para o Nome da Carta
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nome da Carta',
                hintText: 'Digite o nome da carta',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: setController,
              decoration: InputDecoration(
                labelText: 'Set da Carta',
                hintText: 'Digite o nome da carta',
              ),
            ),
            SizedBox(height: 16),
            // Campo de Texto para a Quantidade a Remover
            TextField(
              controller: qttController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Quantidade a Remover',
                hintText: 'Digite a quantidade a ser removida',
              ),
            ),
            SizedBox(height: 16),
            // Botão para Remover Carta
            ElevatedButton(
              onPressed: () async {
                String nomeCarta = nameController.text;
                String setNome = setController.text;
                int quantidadeRemover = int.tryParse(qttController.text) ?? 0;

                if (quantidadeRemover > 0) {
                  // Lógica para obter a quantidade atual da carta no banco de dados
                  int quantidadeAtual = await widget.helper.getQuantidadeCarta(nomeCarta);

                  if (quantidadeRemover == quantidadeAtual) {
                    // Remover a carta se a quantidade a remover for igual à quantidade atual
                    await widget.helper.removerCarta(nomeCarta,setNome);
                    // Exibir mensagem de sucesso ou navegar para outra tela, se necessário
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Carta removida com sucesso'),
                      ),
                    );
                  } else {
                    // Exibir mensagem se a quantidade a remover não for igual à quantidade atual
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('A quantidade a remover não corresponde à quantidade atual'),
                      ),
                    );
                  }
                } else {
                  // Exibir mensagem se a quantidade a remover for inválida
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Quantidade inválida'),
                    ),
                  );
                }
              },
              child: Text('Remover Carta'),
            ),
          ],
        ),
      ),
    );
  }
}
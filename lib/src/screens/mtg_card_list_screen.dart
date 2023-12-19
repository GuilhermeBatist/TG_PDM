import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tg_v1/src/router.dart';


@RoutePage()
class CardListScreen extends StatelessWidget {
  const CardListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MTG"),
      ),
      body: Center(
        child: ElevatedButton(onPressed:(){
          AutoRouter.of(context).push(CardDetailRoute(id: "test123"),
          );
        },
            child: Text("test"))
      ),
    );
  }
}

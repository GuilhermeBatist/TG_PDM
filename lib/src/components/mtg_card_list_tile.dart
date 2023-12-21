import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tg_v1/src/models/mtg_card.dart';
import 'package:tg_v1/src/router.dart';

class CardListTile extends StatelessWidget {
  final MtGCard card;
  const CardListTile(this.card, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(card.name),
      subtitle: Text(card.label),
      onTap: (){
        AutoRouter.of(context).push(CardDetailRoute(id: card.id));
      },
     // onLongPress: (){
       // AutoRouter.of(context).push(CardCollectorRoute(id: card.id));
      //},
    );
  }
}

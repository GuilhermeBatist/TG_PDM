import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tg_v1/src/components/mtg_card_details.dart';
//import 'package:tg_v1/src/components/mtg_card_list.dart';
import 'package:tg_v1/src/providers/mtg_card_detail_provider.dart';


@RoutePage()
class CardDetailScreen extends StatelessWidget {
  final String id;
  const CardDetailScreen({super.key, @PathParam('id') required this.id});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text("MTG Card")),
        body: Consumer(builder: (context, ref,_) {
          final data = ref.watch(mtgCardDetailProvider(id));

          return data.when(
              data: (card) {
                return CardDetails(card);
              },
              error: (e, _)=> Center(child: Text("ERROR: $e"),),
              loading: () => const Center( child: CircularProgressIndicator(),)
          );
        }),
      );
    }
}

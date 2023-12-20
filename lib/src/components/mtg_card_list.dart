import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tg_v1/src/components/mtg_card_list_tile.dart';
import 'package:tg_v1/src/models/mtg_card.dart';
import 'package:tg_v1/src/providers/mtg_card_list_provider.dart';

class CardList extends StatelessWidget {
  const CardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, _){

          final provider = ref.read(mtgCardListProvider.notifier);

          return PagedListView<int, MtGCard>(
            pagingController: provider.pagingController,
            builderDelegate: PagedChildBuilderDelegate<MtGCard>(
                itemBuilder: (context, card,index){
                  return CardListTile(card);
                }
            ),
          );
    }
    );
  }
}

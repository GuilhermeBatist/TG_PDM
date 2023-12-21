import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tg_v1/src/models/mtg_card.dart';
import 'package:tg_v1/src/services/mtg_service.dart';



class MtgCardListProvider extends StateNotifier<List<MtGCard>> {
  final PagingController<int, MtGCard> pagingController = PagingController(firstPageKey: 1);

  MtgCardListProvider() : super([]) {
    pagingController.addPageRequestListener((page) {
      _fetchPage(page);
    });
  }

  Future<void> _fetchPage(int page) async {
    final cards = await MtgService().listCards(page);
    pagingController.appendPage(cards, page + 1);

    state = [...state, ...cards];
  }

  void refresh() {
    state = [];
    pagingController.refresh();
  }
}

final mtgCardListProvider = StateNotifierProvider<MtgCardListProvider, List<MtGCard>>(
      (ref) => MtgCardListProvider(),
);
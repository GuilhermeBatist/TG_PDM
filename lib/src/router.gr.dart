// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CardDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CardDetailRouteArgs>(
          orElse: () => CardDetailRouteArgs(id: pathParams.getString('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CardDetailScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    CardListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CardListScreen(),
      );
    },
  };
}

/// generated route for
/// [CardDetailScreen]
class CardDetailRoute extends PageRouteInfo<CardDetailRouteArgs> {
  CardDetailRoute({
    Key? key,
    required String id,
    List<PageRouteInfo>? children,
  }) : super(
          CardDetailRoute.name,
          args: CardDetailRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'CardDetailRoute';

  static const PageInfo<CardDetailRouteArgs> page =
      PageInfo<CardDetailRouteArgs>(name);
}

class CardDetailRouteArgs {
  const CardDetailRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'CardDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [CardListScreen]
class CardListRoute extends PageRouteInfo<void> {
  const CardListRoute({List<PageRouteInfo>? children})
      : super(
          CardListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CardListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

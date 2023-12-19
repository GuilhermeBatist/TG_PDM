import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage()
class CardDetailScreen extends StatelessWidget {
  final String id;
  const CardDetailScreen({super.key, @PathParam('id') required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MTG"),
      ),
      body: Center(
        child: Text(id),
      ),
    );
  }
}

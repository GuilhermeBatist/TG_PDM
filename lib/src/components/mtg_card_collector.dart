import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardCollector extends StatefulWidget {
  const CardCollector({super.key});

  @override
  State<CardCollector> createState() => _CardCollectorState();
}

class _CardCollectorState extends State<CardCollector> {

  TextEditingController _controller = TextEditingController();
  int cardCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MTG Card Collector'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      labelText: 'Card Count',
                    ),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    // Add your logic for updating the card count
                    String cardCountText = _controller.text;
                    if (cardCountText.isNotEmpty) {
                      int newCardCount = int.tryParse(cardCountText) ?? 0;
                      setState(() {
                        cardCount = newCardCount;
                      });
                      // You can add additional logic here, e.g., updating a database
                      print('Card count updated to: $cardCount');
                    } else {
                      // Handle the case when the TextField is empty
                      print('Please enter a card count');
                    }
                  },
                  child: Text('Commit'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('Current Card Count: $cardCount'),
          ],
        ),
      ),
    );
  }
}

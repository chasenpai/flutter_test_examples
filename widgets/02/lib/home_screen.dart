import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<String> items;

  const HomeScreen({
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        key: const Key('long_list'),
        itemCount: items.length,
        itemBuilder: (context, int index) {
          return Card(
            child: ListTile(
              title: Text(items[index]),
              key: Key('item_${index}_text'),
            ),
          );
        },
      ),
    );
  }
}

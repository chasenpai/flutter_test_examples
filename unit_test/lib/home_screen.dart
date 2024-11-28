import 'package:flutter/material.dart';
import 'package:unit_test/counter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'count',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Text(
              '${counter.value}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => _countUp(),
                  child: const Text(
                    '+',
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _countDown(),
                  child: const Text(
                    '-',
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _clear(),
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
      ),
    );
  }

  void _countUp() {
    setState(() {
      counter.countUp();
    });
  }

  void _countDown() {
    setState(() {
      counter.countDown();
    });
  }

  void _clear() {
    setState(() {
      counter.reset();
    });
  }
}

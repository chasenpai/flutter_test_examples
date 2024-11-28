import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test/counter.dart';

void main() {

  group('counter', () {

    test('must start with 0', () {
      expect(Counter().value, 0);
    });

    test('must be increase by 1', () {
      final counter = Counter();
      counter.countUp();
      expect(counter.value, 1);
    });

    test('must be decrease by 1', () {
      final counter = Counter();
      counter.countDown();
      expect(counter.value, -1);
    });

    test('must be reset to 0', () {
      final counter = Counter();
      counter.countUp();
      counter.reset();
      expect(counter.value, 0);
    });

  });

}
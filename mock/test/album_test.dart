import 'package:flutter_test/flutter_test.dart';
import 'package:mock/album.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'album_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {

  group('album', () {

    test('album returns normally', () async {
      final client = MockClient();
      when(
        client.get(
          Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
        ),
      ).thenAnswer(
        (_) async => http.Response(
          '{"userId": 1,"id": 1,"title": "quidem molestiae enim"}',
          200,
        ),
      );
      expect(await fetchAlbum(client), isA<Album>()); //type
    });

    test('throw exception when 404', () async {
      final client = MockClient();
      when(
        client.get(
          Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
        ),
      ).thenAnswer(
        (_) async => http.Response(
          'Not Found',
          404,
        ),
      );
      expect(fetchAlbum(client), throwsException);
    });

  });

}
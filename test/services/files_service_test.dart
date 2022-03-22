import 'package:flutter_test/flutter_test.dart';
import 'package:folders_sync/services/files_service.dart';

void main() {
  group('RelativePathExtensions', () {
    group('determineRelativePaths', () {
      const basePath = 'a/b';
      const paths = [
        'a/b/c.txt',
        'a/b/d.mp3',
        'a/b/e.jpg',
      ];

      test('expect correct result', () {
        expect(
          paths.determineRelativePaths(basePath),
          ['c.txt', 'd.mp3', 'e.jpg'],
        );
      });
    });
  });
}

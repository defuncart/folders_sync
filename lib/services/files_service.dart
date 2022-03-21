import 'dart:developer' show log;
import 'dart:io';

import 'package:meta/meta.dart';

class FilesService {
  Future<List<String>> filesInFolderANotInFolderB(String pathA, String pathB) async {
    final filesInFolderAAbsolute = await filesInDirectory(pathA);
    final filesInFolderBAbsolute = await filesInDirectory(pathB);

    final filesInFolderA = filesInFolderAAbsolute.determineRelativePaths(pathA);
    final filesInFolderB = filesInFolderBAbsolute.determineRelativePaths(pathB);

    final results = <String>[];
    for (final file in filesInFolderA) {
      if (!filesInFolderB.contains(file)) {
        results.add(file);
      }
    }

    log(results.toString());

    return results;
  }

  @visibleForTesting
  Future<List<String>> filesInDirectory(String path) async {
    return (await directoryContents(path)).map((e) => e.path).toList();
  }

  @visibleForTesting
  Future<List<FileSystemEntity>> directoryContents(String path) async {
    final dir = Directory(path);
    return dir.list(recursive: true, followLinks: false).toList();
  }
}

extension on List<String> {
  List<String> determineRelativePaths(String path) => map((e) => e.replaceAll(path, '')).toList();
}

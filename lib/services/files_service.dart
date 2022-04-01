import 'dart:developer' show log;
import 'dart:io';

import 'package:meta/meta.dart';
import 'package:path/path.dart' as path;

class FilesService {
  Future<void> sync(String pathA, String pathB) async {
    final filesToSync = await filesInFolderANotInFolderB(pathA, pathB);
    await copyFiles(relativeFiles: filesToSync, fromAbsolute: pathA, toAbsolute: pathB);

    final filesToDelete = await filesInFolderANotInFolderB(pathB, pathA);
    await deleteFiles(relativeFiles: filesToDelete, fromAbsolute: pathB);
  }

  @visibleForTesting
  Future<void> copyFiles({
    required List<String> relativeFiles,
    required String fromAbsolute,
    required String toAbsolute,
  }) async {
    for (final relativeFile in relativeFiles) {
      final from = path.join(fromAbsolute, relativeFile);
      final to = path.join(toAbsolute, relativeFile);

      final file = File(from);
      if (!await File(to).exists()) {
        await File(to).create(recursive: true);
      }
      await file.copy(to);
    }
  }

  @visibleForTesting
  Future<void> deleteFiles({
    required List<String> relativeFiles,
    required String fromAbsolute,
  }) async {
    for (final relativeFile in relativeFiles) {
      final from = path.join(fromAbsolute, relativeFile);

      final file = File(from);
      await file.delete();
    }
  }

  @visibleForTesting
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
    return dir.list(recursive: true, followLinks: false).where((e) => FileSystemEntity.isFileSync(e.path)).toList();
  }
}

extension RelativePathExtensions on List<String> {
  @visibleForTesting
  List<String> determineRelativePaths(String path) => map((e) => e.replaceAll(path, '').substring(1)).toList();
}

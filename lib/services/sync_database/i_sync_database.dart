import 'package:folders_sync/services/sync_database/synced_folder.dart';

abstract class ISyncDatabase {
  Stream<List<SyncedFolder>> get watchSyncedFolders;

  Future<void> addSyncedFolder({required String from, required String to});

  Future<void> updateSyncedFolder(SyncedFolder syncedFolder);

  Future<void> removeSyncedFolder(int id);

  Future<void> initialize();

  Future<void> reset();
}

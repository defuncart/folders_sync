import 'package:folders_sync/services/sync_database/i_sync_database.dart';
import 'package:folders_sync/services/sync_database/synced_folder.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

class HiveSyncDatabase implements ISyncDatabase {
  HiveSyncDatabase({
    HiveInterface? hive,
  }) : _hive = hive ?? Hive;

  final HiveInterface _hive;

  /// A box to store objects
  late Box<SyncedFolder> _box;

  /// A name for the box
  @visibleForTesting
  static const boxName = 'syncedFolders';

  @override
  Stream<List<SyncedFolder>> get watchSyncedFolders => _box.watch().map((event) => _box.values.toList());

  @override
  Future<void> addSyncedFolder({required String from, required String to}) async {
    final syncedFolder = SyncedFolder(id: -1, from: from, to: to);
    final id = await _box.add(syncedFolder);
    await updateSyncedFolder(syncedFolder.copyWith(id: id));
  }

  @override
  Future<void> updateSyncedFolder(SyncedFolder syncedFolder) => _box.put(syncedFolder.id, syncedFolder);

  @override
  Future<void> removeSyncedFolder(int id) => _box.delete(id);

  @override
  Future<void> initialize() async {
    final dir = await getApplicationSupportDirectory();
    _hive.init(dir.path);

    if (!_hive.isAdapterRegistered(syncedFolderAdapterTypeId)) {
      _hive.registerAdapter(SyncedFolderAdapter());
    }

    _box = await _hive.openBox<SyncedFolder>(boxName);
  }

  @override
  Future<void> reset() => _box.deleteAll(_box.keys);
}

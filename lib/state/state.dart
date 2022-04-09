import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folders_sync/services/sync_database/hive_sync_database.dart';
import 'package:folders_sync/services/sync_database/i_sync_database.dart';

final syncDatabaseProvider = Provider<ISyncDatabase>(
  (_) => HiveSyncDatabase(),
);

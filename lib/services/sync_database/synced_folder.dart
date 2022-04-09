import 'package:hive/hive.dart';

part 'synced_folder.g.dart';

const syncedFolderAdapterTypeId = 0;

@HiveType(typeId: syncedFolderAdapterTypeId)
class SyncedFolder {
  const SyncedFolder({
    required this.id,
    required this.from,
    required this.to,
  });

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String from;

  @HiveField(2)
  final String to;

  SyncedFolder copyWith({
    int? id,
    String? from,
    String? to,
  }) {
    return SyncedFolder(
      id: id ?? this.id,
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }

  @override
  String toString() => 'SyncedFolder(id: $id, from: $from, to: $to)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is SyncedFolder && other.id == id && other.from == from && other.to == to;
  }

  @override
  int get hashCode => id.hashCode ^ from.hashCode ^ to.hashCode;
}

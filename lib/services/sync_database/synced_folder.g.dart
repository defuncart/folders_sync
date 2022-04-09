// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'synced_folder.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SyncedFolderAdapter extends TypeAdapter<SyncedFolder> {
  @override
  final int typeId = 0;

  @override
  SyncedFolder read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SyncedFolder(
      id: fields[0] as int,
      from: fields[1] as String,
      to: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SyncedFolder obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.from)
      ..writeByte(2)
      ..write(obj.to);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SyncedFolderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

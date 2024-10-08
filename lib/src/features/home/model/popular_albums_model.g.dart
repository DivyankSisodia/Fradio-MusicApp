// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_albums_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PopularAlbumModelAdapter extends TypeAdapter<PopularAlbumModel> {
  @override
  final int typeId = 0;

  @override
  PopularAlbumModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PopularAlbumModel(
      id: fields[0] as String,
      name: fields[1] as String,
      artistId: fields[2] as String,
      artists: fields[3] as String,
      cover: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PopularAlbumModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.artistId)
      ..writeByte(3)
      ..write(obj.artists)
      ..writeByte(4)
      ..write(obj.cover);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PopularAlbumModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

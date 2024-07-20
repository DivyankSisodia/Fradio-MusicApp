// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_artists_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PopularArtistsModelAdapter extends TypeAdapter<PopularArtistsModel> {
  @override
  final int typeId = 1;

  @override
  PopularArtistsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PopularArtistsModel(
      id: fields[0] as String,
      name: fields[1] as String,
      visuals: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PopularArtistsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.visuals);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PopularArtistsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

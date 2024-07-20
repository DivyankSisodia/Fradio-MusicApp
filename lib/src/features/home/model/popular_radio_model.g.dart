// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_radio_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PopularRadioModelAdapter extends TypeAdapter<PopularRadioModel> {
  @override
  final int typeId = 2;

  @override
  PopularRadioModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PopularRadioModel(
      name: fields[0] as String,
      id: fields[1] as String,
      description: fields[2] as String,
      images: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PopularRadioModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PopularRadioModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

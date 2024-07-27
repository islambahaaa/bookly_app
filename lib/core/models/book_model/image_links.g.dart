// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_links.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageLinksAdapter extends TypeAdapter<ImageLinks> {
  @override
  final int typeId = 2;

  @override
  ImageLinks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageLinks(
      thumbnail: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ImageLinks obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.thumbnail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageLinksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

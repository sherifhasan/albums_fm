// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_details_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlbumDetailsResponseAdapter extends TypeAdapter<AlbumDetailsResponse> {
  @override
  final int typeId = 1;

  @override
  AlbumDetailsResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AlbumDetailsResponse(
      artist: fields[0] as String,
      name: fields[1] as String,
      tracks: (fields[2] as List?)?.cast<Track>(),
      imageList: (fields[3] as List?)?.cast<ImageModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, AlbumDetailsResponse obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.artist)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.tracks)
      ..writeByte(3)
      ..write(obj.imageList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlbumDetailsResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

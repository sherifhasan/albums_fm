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
      mbid: fields[3] as String,
      name: fields[1] as String,
      tracks: (fields[2] as List?)?.cast<Track>(),
      imagePath: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AlbumDetailsResponse obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.artist)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.tracks)
      ..writeByte(3)
      ..write(obj.mbid)
      ..writeByte(4)
      ..write(obj.imagePath);
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

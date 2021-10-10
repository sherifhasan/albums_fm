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
      mbid: fields[4] as String,
      image: (fields[1] as List).cast<ImageModel>(),
      tracks: fields[3] as Tracks,
      name: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AlbumDetailsResponse obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.artist)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.tracks)
      ..writeByte(4)
      ..write(obj.mbid);
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

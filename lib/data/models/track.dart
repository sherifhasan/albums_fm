import 'package:hive/hive.dart';

import 'album_details_response.dart';
import 'artist.dart';

part 'track.g.dart';

@HiveType(typeId: 3)
class Track {
  Track({
    this.streamable,
    required this.duration,
    required this.url,
    required this.name,
    this.attr,
    this.artist,
  });

  @HiveField(0)
  final String url;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int duration;

  final Streamable? streamable;

  final Attr? attr;
  final Artist? artist;

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        streamable: Streamable.fromJson(json["streamable"]),
        duration: json["duration"],
        url: json["url"],
        name: json["name"],
        attr: Attr.fromJson(json["@attr"]),
        artist: Artist.fromJson(json["artist"]),
      );

  Map<String, dynamic> toJson() => {
        "streamable": streamable?.toJson(),
        "duration": duration,
        "url": url,
        "name": name,
        "@attr": attr?.toJson(),
        "artist": artist?.toJson(),
      };
}

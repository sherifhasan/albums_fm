import 'package:hive/hive.dart';

import 'artist.dart';
import 'image_model.dart';

class Album {
  Album({
    required this.name,
    required this.playCount,
    this.mbid,
    required this.url,
    required this.artist,
    required this.image,
  });

  final String name;
  @HiveField(1)
  final Artist artist;
  @HiveField(2)
  final List<ImageModel> image;

  final int playCount;
  final String? mbid;
  final String url;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        name: json["name"],
        playCount: json["playcount"],
        mbid: json["mbid"],
        url: json["url"],
        artist: Artist.fromJson(json["artist"]),
        image: json["image"] != null
            ? List<ImageModel>.from(
                json["image"].map((x) => ImageModel.fromJson(x)))
            : <ImageModel>[],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "playcount": playCount,
        "mbid": mbid,
        "url": url,
        "artist": artist.toJson(),
        "image": List<ImageModel>.from(image.map((x) => x.toJson())),
      };
}

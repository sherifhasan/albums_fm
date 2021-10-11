import 'artist.dart';
import 'image_model.dart';

class Album {
  Album({
    required this.name,
    required this.playCount,
    required this.url,
    required this.artist,
    required this.imageList,
    this.mbid,
  });

  final String name;

  final Artist artist;
  final List<ImageModel> imageList;

  final String? mbid;

  final int playCount;
  final String url;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        name: json["name"],
        playCount: json["playcount"],
        mbid: json["mbid"],
        url: json["url"],
        artist: Artist.fromJson(json["artist"]),
        imageList: json["image"] != null
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
        "image": List<ImageModel>.from(imageList.map((x) => x.toJson())),
      };
}

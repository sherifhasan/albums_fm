import 'package:hive/hive.dart';

import 'image_model.dart';
import 'track.dart';

part 'album_details_response.g.dart';

@HiveType(typeId: 1)
class AlbumDetailsResponse {
  AlbumDetailsResponse({
    required this.artist,
    required this.name,
    this.tracks,
    this.mbid,
    this.imageList,
    this.tags,
    this.url,
    this.playCount,
    this.listeners,
    this.wiki,
  });

  const AlbumDetailsResponse.empty()
      : artist = "",
        mbid = "",
        playCount = "",
        url = "",
        name = "",
        listeners = "",
        tags = const <Tag>[],
        imageList = const <ImageModel>[],
        tracks = const <Track>[],
        wiki = const Wiki.empty();

  @HiveField(0)
  final String artist;

  @HiveField(1)
  final String name;
  @HiveField(2)
  final List<Track>? tracks;
  final String? mbid;

  @HiveField(3)
  final List<ImageModel>? imageList;
  final List<Tag>? tags;
  final String? playCount;
  final String? url;
  final String? listeners;
  final Wiki? wiki;

  factory AlbumDetailsResponse.fromJson(Map<String, dynamic> jsonInput) {
    final json = jsonInput["album"];
    return AlbumDetailsResponse(
      artist: json["artist"],
      mbid: json["mbid"],
      tags: json["tags"] != null && json["tags"] != ''
          ? List<Tag>.from(json["tags"]["tag"].map((x) => Tag.fromJson(x)))
          : null,
      playCount: json["playcount"],
      imageList: json["image"] != null
          ? List<ImageModel>.from(
              json["image"].map((x) => ImageModel.fromJson(x)))
          : null,
      tracks: json["tracks"] != null
          ? List<Track>.from(
              json["tracks"]["track"].map((x) => Track.fromJson(x)))
          : null,
      url: json["url"],
      name: json["name"],
      listeners: json["listeners"],
      wiki: json["wiki"] != null ? Wiki.fromJson(json["wiki"]) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "album": {
          "artist": artist,
          "mbid": mbid,
          "playcount": playCount,
          "image": imageList != null
              ? List<dynamic>.from(imageList!.map((x) => x.toJson()))
              : null,
          "tracks": {
            "track": tracks != null
                ? List<dynamic>.from(tracks!.map((x) => x.toJson()))
                : null
          },
          "tags": {
            "tag": tags != null
                ? List<dynamic>.from(tags!.map((x) => x.toJson()))
                : null
          },
          "url": url,
          "name": name,
          "listeners": listeners,
          "wiki": wiki?.toJson(),
        }
      };
}

class Tag {
  Tag({
    required this.url,
    required this.name,
  });

  final String url;
  final String name;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        url: json["url"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "name": name,
      };
}

class Attr {
  Attr({
    required this.rank,
  });

  final int rank;

  factory Attr.fromJson(Map<String, dynamic> json) => Attr(
        rank: json["rank"],
      );

  Map<String, dynamic> toJson() => {
        "rank": rank,
      };
}

class Streamable {
  Streamable({
    required this.fulltrack,
    required this.text,
  });

  final String fulltrack;
  final String text;

  factory Streamable.fromJson(Map<String, dynamic> json) => Streamable(
        fulltrack: json["fulltrack"],
        text: json["#text"],
      );

  Map<String, dynamic> toJson() => {
        "fulltrack": fulltrack,
        "#text": text,
      };
}

class Wiki {
  Wiki({
    required this.published,
    required this.summary,
    required this.content,
  });

  const Wiki.empty()
      : published = "",
        summary = "",
        content = "";

  final String published;
  final String summary;
  final String content;

  factory Wiki.fromJson(Map<String, dynamic> json) => Wiki(
        published: json["published"],
        summary: json["summary"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "published": published,
        "summary": summary,
        "content": content,
      };
}

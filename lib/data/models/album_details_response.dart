import 'package:hive/hive.dart';

import 'image_model.dart';
import 'track.dart';

part 'album_details_response.g.dart';

@HiveType(typeId: 1)
class AlbumDetailsResponse {
  AlbumDetailsResponse({
    required this.artist,
    required this.mbid,
    this.tags,
    this.playCount,
    required this.imageList,
    required this.tracks,
    this.url,
    required this.name,
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
        tags = const Tags.empty(),
        imageList = const <ImageModel>[],
        tracks = const Tracks.empty(),
        wiki = const Wiki.empty();
  @HiveField(0)
  final String artist;
  @HiveField(1)
  final List<ImageModel> imageList;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final Tracks tracks;
  @HiveField(4)
  final String mbid;
  final Tags? tags;
  final String? playCount;
  final String? url;
  final String? listeners;
  final Wiki? wiki;

  factory AlbumDetailsResponse.fromJson(Map<String, dynamic> jsonInput) {
    final json = jsonInput["album"];
    return AlbumDetailsResponse(
      artist: json["artist"],
      mbid: json["mbid"],
      tags: Tags.fromJson(json["tags"]),
      playCount: json["playcount"],
      imageList: List<ImageModel>.from(
          json["image"].map((x) => ImageModel.fromJson(x))),
      tracks: Tracks.fromJson(json["tracks"]),
      url: json["url"],
      name: json["name"],
      listeners: json["listeners"],
      wiki: Wiki.fromJson(json["wiki"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "album": {
          "artist": artist,
          "mbid": mbid,
          "tags": tags?.toJson(),
          "playcount": playCount,
          "image": List<dynamic>.from(imageList.map((x) => x.toJson())),
          "tracks": tracks.toJson(),
          "url": url,
          "name": name,
          "listeners": listeners,
          "wiki": wiki?.toJson(),
        }
      };
}

class Tags {
  Tags({
    required this.tag,
  });

  const Tags.empty() : tag = const <Tag>[];

  final List<Tag> tag;

  factory Tags.fromJson(Map<String, dynamic> json) => Tags(
        tag: List<Tag>.from(json["tag"].map((x) => Tag.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tag": List<dynamic>.from(tag.map((x) => x.toJson())),
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

class Tracks {
  Tracks({
    required this.tracksList,
  });

  const Tracks.empty() : tracksList = const <Track>[];

  final List<Track> tracksList;

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        tracksList: List<Track>.from(json["track"].map((x) => Track.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "track": List<dynamic>.from(tracksList.map((x) => x.toJson())),
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

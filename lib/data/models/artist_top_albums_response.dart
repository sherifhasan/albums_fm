import 'package:flutter/foundation.dart';

@immutable
class ArtistTopAlbums {
  const ArtistTopAlbums({
    required this.topAlbums,
  });

  final TopAlbums topAlbums;

  factory ArtistTopAlbums.fromJson(Map<String, dynamic> json) =>
      ArtistTopAlbums(
        topAlbums: TopAlbums.fromJson(json["topalbums"]),
      );

  Map<String, dynamic> toJson() => {
        "topalbums": topAlbums.toJson(),
      };
}

class TopAlbums {
  TopAlbums({
    required this.album,
    required this.attr,
  });

  final List<Album> album;
  final Attr attr;

  factory TopAlbums.fromJson(Map<String, dynamic> json) => TopAlbums(
        album: List<Album>.from(json["album"].map((x) => Album.fromJson(x))),
        attr: Attr.fromJson(json["@attr"]),
      );

  Map<String, dynamic> toJson() => {
        "album": List<dynamic>.from(album.map((x) => x.toJson())),
        "@attr": attr.toJson(),
      };
}

class Album {
  Album({
    required this.name,
    required this.playCount,
    required this.mbid,
    required this.url,
    required this.artist,
    required this.image,
  });

  final String name;
  final int playCount;
  final String mbid;
  final String url;
  final Artist artist;
  final List<ImageModel> image;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        name: json["name"],
        playCount: json["playcount"],
        mbid: json["mbid"],
        url: json["url"],
        artist: Artist.fromJson(json["artist"]),
        image: List<ImageModel>.from(
            json["image"].map((x) => ImageModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "playcount": playCount,
        "mbid": mbid,
        "url": url,
        "artist": artist.toJson(),
        "image": List<dynamic>.from(image.map((x) => x.toJson())),
      };
}

class Artist {
  Artist({
    required this.name,
    required this.mbid,
    required this.url,
  });

  final String name;
  final String mbid;
  final String url;

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        name: json["name"],
        mbid: json["mbid"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "mbid": mbid,
        "url": url,
      };
}

class ImageModel {
  ImageModel({
    required this.text,
    required this.size,
  });

  final String text;
  final String size;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        text: json["#text"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "#text": text,
        "size": size,
      };
}

class Attr {
  Attr({
    required this.artist,
    required this.page,
    required this.perPage,
    required this.totalPages,
    required this.total,
  });

  final String artist;
  final String page;
  final String perPage;
  final String totalPages;
  final String total;

  factory Attr.fromJson(Map<String, dynamic> json) => Attr(
        artist: json["artist"],
        page: json["page"],
        perPage: json["perPage"],
        totalPages: json["totalPages"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "artist": artist,
        "page": page,
        "perPage": perPage,
        "totalPages": totalPages,
        "total": total,
      };
}

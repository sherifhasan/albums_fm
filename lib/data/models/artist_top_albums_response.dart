import 'package:flutter/foundation.dart';

import 'album.dart';

@immutable
class ArtistTopAlbums {
  const ArtistTopAlbums({
    required this.albums,
    required this.attr,
  });

  final List<Album> albums;
  final Attr attr;

  const ArtistTopAlbums.empty()
      : albums = const <Album>[],
        attr = const Attr.empty();

  factory ArtistTopAlbums.fromJson(Map<String, dynamic> jsonInput) {
    final json = jsonInput["topalbums"];
    return ArtistTopAlbums(
      albums: List<Album>.from(json["album"].map((x) => Album.fromJson(x))),
      attr: Attr.fromJson(json["@attr"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "topalbums": {
          "album": List<dynamic>.from(albums.map((x) => x.toJson())),
          "@attr": attr.toJson(),
        }
      };
}

class Attr {
  const Attr({
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

  const Attr.empty()
      : artist = "",
        page = "",
        perPage = "",
        totalPages = "",
        total = "";

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

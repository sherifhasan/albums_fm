import 'package:flutter/material.dart';

@immutable
class ArtistSearchResponse {
  const ArtistSearchResponse({
    required this.results,
  });

  final Results results;

  factory ArtistSearchResponse.fromJson(Map<String, dynamic> json) =>
      ArtistSearchResponse(
        results: Results.fromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
        "results": results.toJson(),
      };
}

class Results {
  Results({
    required this.openSearchQuery,
    required this.openSearchTotalResults,
    required this.openSearchStartIndex,
    required this.openSearchItemsPerPage,
    required this.artistMatches,
    required this.attr,
  });

  final OpenSearchQuery openSearchQuery;
  final String openSearchTotalResults;
  final String openSearchStartIndex;
  final String openSearchItemsPerPage;
  final ArtistMatches artistMatches;
  final Attr attr;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        openSearchQuery: OpenSearchQuery.fromJson(json["opensearch:Query"]),
        openSearchTotalResults: json["opensearch:totalResults"],
        openSearchStartIndex: json["opensearch:startIndex"],
        openSearchItemsPerPage: json["opensearch:itemsPerPage"],
        artistMatches: ArtistMatches.fromJson(json["artistmatches"]),
        attr: Attr.fromJson(json["@attr"]),
      );

  Map<String, dynamic> toJson() => {
        "opensearch:Query": openSearchQuery.toJson(),
        "opensearch:totalResults": openSearchTotalResults,
        "opensearch:startIndex": openSearchStartIndex,
        "opensearch:itemsPerPage": openSearchItemsPerPage,
        "artistmatches": artistMatches.toJson(),
        "@attr": attr.toJson(),
      };
}

class ArtistMatches {
  ArtistMatches({
    required this.artist,
  });

  final List<Artist> artist;

  factory ArtistMatches.fromJson(Map<String, dynamic> json) => ArtistMatches(
        artist:
            List<Artist>.from(json["artist"].map((x) => Artist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "artist": List<dynamic>.from(artist.map((x) => x.toJson())),
      };
}

class Artist {
  Artist({
    required this.name,
    required this.listeners,
    required this.mbid,
    required this.url,
    required this.streamable,
    required this.image,
  });

  final String name;
  final String listeners;
  final String mbid;
  final String url;
  final String streamable;
  final List<ImageModel> image;

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        name: json["name"],
        listeners: json["listeners"],
        mbid: json["mbid"],
        url: json["url"],
        streamable: json["streamable"],
        image: List<ImageModel>.from(
            json["image"].map((x) => ImageModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "listeners": listeners,
        "mbid": mbid,
        "url": url,
        "streamable": streamable,
        "image": List<dynamic>.from(image.map((x) => x.toJson())),
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
    required this.attrFor,
  });

  final String attrFor;

  factory Attr.fromJson(Map<String, dynamic> json) => Attr(
        attrFor: json["for"],
      );

  Map<String, dynamic> toJson() => {
        "for": attrFor,
      };
}

class OpenSearchQuery {
  OpenSearchQuery({
    required this.text,
    required this.role,
    required this.searchTerms,
    required this.startPage,
  });

  final String text;
  final String role;
  final String searchTerms;
  final String startPage;

  factory OpenSearchQuery.fromJson(Map<String, dynamic> json) =>
      OpenSearchQuery(
        text: json["#text"],
        role: json["role"],
        searchTerms: json["searchTerms"],
        startPage: json["startPage"],
      );

  Map<String, dynamic> toJson() => {
        "#text": text,
        "role": role,
        "searchTerms": searchTerms,
        "startPage": startPage,
      };
}

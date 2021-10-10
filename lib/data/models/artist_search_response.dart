import 'package:flutter/material.dart';

import 'artist.dart';

@immutable
class ArtistSearchResponse {
  const ArtistSearchResponse({
    required this.openSearchQuery,
    required this.openSearchTotalResults,
    required this.openSearchStartIndex,
    required this.openSearchItemsPerPage,
    required this.artistMatches,
    required this.attr,
  });

  const ArtistSearchResponse.empty()
      : openSearchTotalResults = "",
        openSearchStartIndex = "",
        openSearchItemsPerPage = "",
        artistMatches = const ArtistMatches.empty(),
        attr = const Attr.empty(),
        openSearchQuery = const OpenSearchQuery.empty();

  final OpenSearchQuery openSearchQuery;
  final String openSearchTotalResults;
  final String openSearchStartIndex;
  final String openSearchItemsPerPage;
  final ArtistMatches artistMatches;
  final Attr attr;

  factory ArtistSearchResponse.fromJson(Map<String, dynamic> jsonInput) {
    final json = jsonInput["results"];
    return ArtistSearchResponse(
      openSearchQuery: OpenSearchQuery.fromJson(json["opensearch:Query"]),
      openSearchTotalResults: json["opensearch:totalResults"],
      openSearchStartIndex: json["opensearch:startIndex"],
      openSearchItemsPerPage: json["opensearch:itemsPerPage"],
      artistMatches: ArtistMatches.fromJson(json["artistmatches"]),
      attr: Attr.fromJson(json["@attr"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "results": {
          "opensearch:Query": openSearchQuery.toJson(),
          "opensearch:totalResults": openSearchTotalResults,
          "opensearch:startIndex": openSearchStartIndex,
          "opensearch:itemsPerPage": openSearchItemsPerPage,
          "artistmatches": artistMatches.toJson(),
          "@attr": attr.toJson(),
        }
      };
}

class ArtistMatches {
  ArtistMatches({
    required this.artistsList,
  });

  const ArtistMatches.empty() : artistsList = const <Artist>[];

  final List<Artist> artistsList;

  factory ArtistMatches.fromJson(Map<String, dynamic> json) => ArtistMatches(
        artistsList:
            List<Artist>.from(json["artist"].map((x) => Artist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "artist": List<dynamic>.from(artistsList.map((x) => x.toJson())),
      };
}

class Attr {
  Attr({
    required this.attrFor,
  });

  const Attr.empty() : attrFor = "";

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

  const OpenSearchQuery.empty()
      : text = "",
        role = "",
        searchTerms = "",
        startPage = "";

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

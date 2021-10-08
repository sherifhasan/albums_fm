class AlbumDetailsResponse {
  AlbumDetailsResponse({
    required this.album,
  });

  final Album album;

  factory AlbumDetailsResponse.fromJson(Map<String, dynamic> json) =>
      AlbumDetailsResponse(
        album: Album.fromJson(json["album"]),
      );

  Map<String, dynamic> toJson() => {
        "album": album.toJson(),
      };
}

class Album {
  Album({
    required this.artist,
    required this.mbid,
    required this.tags,
    required this.playCount,
    required this.image,
    required this.tracks,
    required this.url,
    required this.name,
    required this.listeners,
    required this.wiki,
  });

  final String artist;
  final String mbid;
  final Tags tags;
  final String playCount;
  final List<ImageModel> image;
  final Tracks tracks;
  final String url;
  final String name;
  final String listeners;
  final Wiki wiki;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        artist: json["artist"],
        mbid: json["mbid"],
        tags: Tags.fromJson(json["tags"]),
        playCount: json["playcount"],
        image: List<ImageModel>.from(
            json["image"].map((x) => ImageModel.fromJson(x))),
        tracks: Tracks.fromJson(json["tracks"]),
        url: json["url"],
        name: json["name"],
        listeners: json["listeners"],
        wiki: Wiki.fromJson(json["wiki"]),
      );

  Map<String, dynamic> toJson() => {
        "artist": artist,
        "mbid": mbid,
        "tags": tags.toJson(),
        "playcount": playCount,
        "image": List<dynamic>.from(image.map((x) => x.toJson())),
        "tracks": tracks.toJson(),
        "url": url,
        "name": name,
        "listeners": listeners,
        "wiki": wiki.toJson(),
      };
}

class ImageModel {
  ImageModel({
    required this.size,
    required this.text,
  });

  final String size;
  final String text;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        size: json["size"],
        text: json["#text"],
      );

  Map<String, dynamic> toJson() => {
        "size": size,
        "#text": text,
      };
}

class Tags {
  Tags({
    required this.tag,
  });

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
    required this.track,
  });

  final List<Track> track;

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        track: List<Track>.from(json["track"].map((x) => Track.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "track": List<dynamic>.from(track.map((x) => x.toJson())),
      };
}

class Track {
  Track({
    required this.streamable,
    required this.duration,
    required this.url,
    required this.name,
    required this.attr,
    required this.artist,
  });

  final Streamable streamable;
  final int duration;
  final String url;
  final String name;
  final Attr attr;
  final Artist artist;

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        streamable: Streamable.fromJson(json["streamable"]),
        duration: json["duration"],
        url: json["url"],
        name: json["name"],
        attr: Attr.fromJson(json["@attr"]),
        artist: Artist.fromJson(json["artist"]),
      );

  Map<String, dynamic> toJson() => {
        "streamable": streamable.toJson(),
        "duration": duration,
        "url": url,
        "name": name,
        "@attr": attr.toJson(),
        "artist": artist.toJson(),
      };
}

class Artist {
  Artist({
    required this.url,
    required this.name,
    required this.mbid,
  });

  final String url;
  final String name;
  final String mbid;

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        url: json["url"],
        name: json["name"],
        mbid: json["mbid"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "name": name,
        "mbid": mbid,
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

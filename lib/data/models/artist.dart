import 'image_model.dart';

class Artist {
  Artist({
    required this.name,
    required this.listeners,
    this.mbid,
    required this.url,
    required this.streamable,
    required this.image,
  });

  final String name;
  final String? listeners;
  final String? mbid;
  final String? url;
  final String? streamable;
  final List<ImageModel>? image;

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        name: json["name"],
        listeners: json["listeners"],
        mbid: json["mbid"],
        url: json["url"],
        streamable: json["streamable"],
        image: json["image"] != null
            ? List<ImageModel>.from(
                json["image"]!.map((x) => ImageModel.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "listeners": listeners,
        "mbid": mbid,
        "url": url,
        "streamable": streamable,
        "image": image == null
            ? null
            : List<dynamic>.from(image!.map((x) => x.toJson())),
      };
}

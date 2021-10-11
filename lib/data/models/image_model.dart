import 'package:hive/hive.dart';

part 'image_model.g.dart';

@HiveType(typeId: 2)
class ImageModel {
  ImageModel({
    required this.size,
    this.text,
  });

  @HiveField(0)
  final String size;
  @HiveField(1)
  final String? text;

  ImageModel.empty()
      : size = "",
        text = "";

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        size: json["size"],
        text: json["#text"],
      );

  Map<String, dynamic> toJson() => {
        "size": size,
        "#text": text,
      };
}

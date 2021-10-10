class ImageModel {
  ImageModel({
    required this.size,
    this.text,
  });

  final String size;
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

class WallpaperModel {
  String imgUrl;
  String photographer;
  String avaColor;
  String alt;

  WallpaperModel({
    required this.imgUrl,
    required this.photographer,
    required this.avaColor,
    required this.alt,
  });

  factory WallpaperModel.fromMap(Map<String, dynamic> map) {
    return WallpaperModel(
      imgUrl: map["src"]["portrait"],
      photographer: map["photographer"],
      avaColor: map["avg_color"],
      alt: map["alt"],
    );
  }
}

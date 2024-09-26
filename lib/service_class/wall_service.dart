import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:wallpaper/model_class/wall_model.dart';

class WallpaperService {
  final _baseUrl = "https://api.pexels.com/v1/";
  final _key = "yiwuOHdRRfQtI6x1WbkHESqI71onJ5vIw1Fd4bgFFbU8Ff87pM7OMUHD";

  Future<List<WallpaperModel>> fetchWallpaperData(String category) async {
    try {
      final url = "${_baseUrl}search?query=${category}&per_page=10";
      final response = await http.get(Uri.parse(url), headers: {
        "Authorization": _key,
      });
      final allData = jsonDecode(response.body);
      final List data = allData["photos"];
      return data.map((photos) => WallpaperModel.fromMap(photos)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> downloadPhoto(String imgUrl) async {
    final Uri _url = Uri.parse(imgUrl);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}

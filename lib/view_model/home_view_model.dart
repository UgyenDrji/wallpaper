
import 'package:get/get.dart';
import 'package:wallpaper/controller/wallpaper_services.dart';
import 'package:wallpaper/model/wallpaper.dart';

class HomeViewModel extends GetxController {
  bool isLoading = false;
  Map<String, List<Wallpaper>> wallpapers = {};

  vmGetwallpaperData(String category) async {
    isLoading = true;
    update();
    wallpapers[category] = await WallpaperServices().fatchNature(category);
    isLoading =false;
    update();
  }

  List<Wallpaper> vmWallpapers(String category) {
    return wallpapers[category] ?? [];
  }
}

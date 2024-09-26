import 'package:get/get.dart';
import 'package:wallpaper/model_class/wall_model.dart';
import 'package:wallpaper/service_class/wall_service.dart';

class HomeViewModel extends GetxController {
  bool isLoading = false;
  Map<String, List<WallpaperModel>> wallpapers = {};

  vmGetwallpaperData(String category) async {
    isLoading = true;
    update();
    wallpapers[category] =
        await WallpaperService().fetchWallpaperData(category);
    isLoading = false;
    update();
  }

  List<WallpaperModel> vmWallpapers(String category) {
    return wallpapers[category] ?? [];
  }
}

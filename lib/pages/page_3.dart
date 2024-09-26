import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/model_class/wall_model.dart';
class FullscreenPage extends StatefulWidget {
  const FullscreenPage({super.key});

  @override
  State<FullscreenPage> createState() => _FullscreenPageState();
}

class _FullscreenPageState extends State<FullscreenPage> {
  @override
  Widget build(BuildContext context) {
    final WallpaperModel photo= Get.arguments;
    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
        leading: IconButton(onPressed: (){
      Get.back();
    }, icon: Icon(Icons.arrow_back_sharp,color: Colors.white,)),
        ),
      body: Hero(
        tag: photo.imgUrl,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(image: NetworkImage("${photo.imgUrl}"), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

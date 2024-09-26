import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wallpaper/model_class/wall_model.dart';
import 'package:wallpaper/service_class/wall_service.dart';
class WallpaperDescription extends StatefulWidget {
  const WallpaperDescription({super.key});

  @override
  State<WallpaperDescription> createState() => _WallpaperDescriptionState();
}

class _WallpaperDescriptionState extends State<WallpaperDescription> {
  @override
  Widget build(BuildContext context) {
    final WallpaperModel photo= Get.arguments;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_sharp,color: Colors.white,)),
        title: Text(
          "Wallpics",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(20),
            Hero(
              tag: photo.imgUrl,
              child: Container(
                height: 600,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(image: NetworkImage("${photo.imgUrl}"), fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      right: 10,
                      child: GestureDetector(
                        onTap: (){
                          Get.toNamed("/page3", arguments: photo);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black26.withOpacity(0.8)
                          ),
                          child: Icon(Icons.fullscreen,size: 25,color: Colors.white,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(10),
            Container(
              child: Column(
                children: [
                  Text("${photo.alt}",style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23,
                  ),textAlign: TextAlign.center,),
                  Gap(10),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person,color: Colors.white,),
                          Gap(5),
                          Text("Photographer",style: TextStyle(
                              color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: Text("${photo.photographer}",style: TextStyle(
                              color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold
                          )),
                        ),
                      )
                    ],
                  ),
                  Gap(15),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.camera_alt,color: Colors.white,),
                          Gap(5),
                          Text("Photo by",style: TextStyle(
                              color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                      Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: Text("Pixel",style: TextStyle(
                              color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold
                          )),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Gap(10),
            MaterialButton(
              color: Colors.white60,
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.download,color: Colors.white,),
                  Text('Download...',style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18
                  ),),
                ],
              ),
              onPressed: () async {
                WallpaperService().downloadPhoto(photo.imgUrl);
              },
            ),
          ],
        ),
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/pages/page1.dart';
import 'package:wallpaper/pages/page2.dart';
import 'package:wallpaper/pages/page_3.dart';
import 'package:wallpaper/pages/splash_screen.dart';
import 'package:wallpaper/view_page/home_view.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      getPages: [
        GetPage(name: "/splash", page: ()=>SplashScreen()),
        GetPage(name: "/page1", page: ()=>WallpaperPage()),
        GetPage(name: "/page2", page: ()=>WallpaperDescription()),
        GetPage(name: "/page3", page: ()=>FullscreenPage()),
        GetPage(name: "/vhome", page: ()=>HomeView())
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

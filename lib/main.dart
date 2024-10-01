
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/pages/people_home.dart';
import 'package:wallpaper/pages/splash_screen.dart';
import 'package:wallpaper/pages/wall_home.dart';
import 'package:wallpaper/view_page/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/home', page: ()=> WallHome()),
        GetPage(name: '/people', page: ()=> PeopleHome()),
        GetPage(name: '/splash', page: ()=> SplashScreen()),
        /// emulator will not crush
        // GetPage(name: '/view', page: ()=> HomeView()),
      ],
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: WallHome(),
    );
  }
}
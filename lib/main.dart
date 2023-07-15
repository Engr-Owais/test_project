import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/movies_home_controller.dart';
import 'views/landing_page.dart';
import 'views/movies_details_page.dart';
import 'views/movies_home_screen.dart';

void main() {
  Get.put<MoviesHomeController>(MoviesHomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TEST APP',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LandingPage()),
        GetPage(name: '/homeScreen', page: () => MoviesHomeScreen()),
        GetPage(name: '/movieDetails', page: () => MovieDetailsScreen()),
      ],
    );
  }
}

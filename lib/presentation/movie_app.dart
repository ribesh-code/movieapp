import 'package:flutter/material.dart';
import 'package:movieapp/common/screen_utils/screen_utils.dart';
import 'package:movieapp/presentation/journeys/home_screen.dart';
import 'package:movieapp/presentation/themes/app_color.dart';
import 'package:movieapp/presentation/themes/app_text_theme.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        primaryColor: AppColor.vulcan,
        scaffoldBackgroundColor: AppColor.vulcan,
        textTheme: AppTextTheme.getTextTheme(),
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      home: const HomeScreen(),
    );
  }
}

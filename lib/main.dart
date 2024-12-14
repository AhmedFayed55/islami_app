import 'package:flutter/material.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/home/my_app_themes.dart';
import 'package:islami_app/home/tabs/hadith_tab/hadith_details_screen.dart';
import 'package:islami_app/home/tabs/quran_tabs/sura_content_line_by_line.dart';
import 'package:islami_app/home/tabs/quran_tabs/sura_details.dart';
import 'package:islami_app/introduction_screens/introduction_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: IntroductionScreens.routeName,
      routes: {
        IntroductionScreens.routeName: (context) => IntroductionScreens(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        Sequential.routeName: (context) => Sequential(),
        HadithDetailsScreen.routeName: (context) => HadithDetailsScreen(),
      },
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}

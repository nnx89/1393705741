import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profile_formal/page/profile_page.dart';
import 'package:profile_formal/themes.dart';
import 'package:profile_formal/utils/user_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'User Profile';

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return ThemeProvider(
      initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeProvider.of(context),
          title: title,
          home: ProfilePage(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ui/screens/home_screen.dart';
import 'ui/screens/welcome_screen.dart';
import 'utilities/material_theme.dart';
import 'utilities/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MySharedPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget _toggleScreen() {
    if (MySharedPreferences.isLogIn && MySharedPreferences.accessToken.isNotEmpty) {
      return const HomeScreen();
    } else {
      return const WelcomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Task',
      theme: AppThemeData().materialTheme,
      home: _toggleScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


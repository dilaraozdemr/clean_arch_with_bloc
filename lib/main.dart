import 'package:flutter/material.dart';
import 'package:harry_potter_clean/application/pages/home/potter_home_page.dart';
import 'package:harry_potter_clean/theme.dart';
import 'package:provider/provider.dart';
import 'application/core/services/theme_service.dart';
import 'injection.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const PotterHomePageWrapperProvider(),
      );
    });
  }
}
import 'package:flutter/material.dart';
import 'package:language_learning/constant/constant.dart';
import 'package:language_learning/presentation/pages/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
  // MobileAds.instance.updateRequestConfiguration(RequestConfiguration(
  //     testDeviceIds: ['0A413C505EF6CC4FF6776519C618B75D']));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Language Learning',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(foregroundColor: Colors.white),
          scaffoldBackgroundColor: onBoardingBg),
      home: const SplashPage(),
    );
  }
}

/*
echo "# language_learning" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/nestsoft-dev/language_learning.git
git push -u origin main*/
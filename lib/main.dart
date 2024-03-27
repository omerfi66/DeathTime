import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:denemeblocccdeneme/repository/auth/login/login_repository.dart';
import 'package:denemeblocccdeneme/view/auth/login/login_screen.dart';
import 'package:denemeblocccdeneme/view/splash_scree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ölüm tarihim?',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FlutterSplashScreen(
        duration: const Duration(milliseconds: 2000),
        backgroundColor: Colors.black,
        splashScreenBody: const AnimatedSplashScreenBody(),
        nextScreen: RepositoryProvider(
            create: (context) => LoginRepository(), child: const LoginScreen()),
      ),
    );
  }
}

import 'package:firebase_example/core/di/main_binding.dart';
import 'package:firebase_example/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MainBinding(),
      initialRoute: '/',
      getPages: [GetPage(name: '/', page: () => HomeScreen())],
    );
  }
}

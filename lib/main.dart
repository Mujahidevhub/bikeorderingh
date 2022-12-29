import 'package:bikeordering/Controllers/login_controller.dart';
import 'package:bikeordering/View/selectyourbike.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'View/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         appBarTheme: AppBarTheme(backgroundColor: Colors.indigo),
         primarySwatch: Colors.indigo,
      ),
      home:   GetBuilder(
        init: Get.put(GetXHelper()),
        builder: (authcontroller) {
          return authcontroller.currentUser == null ? Signup() : SelectYourBike();
        }
      ),

      debugShowCheckedModeBanner: false,
    );
  }
}

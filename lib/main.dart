import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/bindings/home_binding.dart';
import 'app/pages/login_page.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "IziFood app",
      initialBinding: HomeBinding(),
      home: LoginPage(),
      theme: ThemeData(
        primaryColor: Color(0xffff2956),
      ),
    ),
  );
}

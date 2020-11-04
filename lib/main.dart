import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/pages/home_page.dart';
import 'app/pages/login_page.dart';

void main() {
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "IziFood app",
      home: LoginPage(),
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/home', page: () => HomePage())
      ]));
}

import 'package:flutter/material.dart';

Widget bottomNavigationWidget() {
  return BottomNavigationBar(
      backgroundColor: Colors.white,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 30), label: 'home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined, size: 30), label: 'Empregados'),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 30), label: 'sobre')
      ]);
}

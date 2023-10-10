import 'package:flutter/material.dart';
import 'package:blog_explorer/screens/app_bottom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog Explorer',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: AppBottomNavigation(),
    );
  }
}
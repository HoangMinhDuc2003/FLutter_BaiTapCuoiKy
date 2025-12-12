import 'package:bai_giua_ky/List_BaiTap.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Bài Tập Cuối Kỳ", home: List_BaiTap());
  }
}

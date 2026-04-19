import 'package:flutter/material.dart';
import 'pages/Auth1.dart'; // تأكدي من اسم المسار والملف عندك

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Auth1Widget(), // اسم الـ Widget بتاع صفحة الدخول
    );
  }
}

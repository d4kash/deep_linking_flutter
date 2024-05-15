import 'package:flutter/material.dart';
import 'package:flutterdeeplinkingsample/app_link_deep_lnking.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlutterDeepLinking(),
    );
  }
}
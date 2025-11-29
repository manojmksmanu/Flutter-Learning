import 'package:flutter/material.dart';
import 'package:my_app/pages/Login_screen.dart';
import 'package:my_app/pages/list_widgets.dart';
import 'package:my_app/pages/widgets_learning_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: WidgetTypesScreen());
  }
}

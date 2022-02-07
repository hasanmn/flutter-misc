import 'package:flutter/material.dart';
import 'package:misctech/shared/widgets/app_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MiscTech',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AppWidget(),
    );
  }
}

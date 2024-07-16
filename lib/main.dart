import 'package:flutter/material.dart';
import 'package:task5/profileInfo.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/user/:id': (context) {
          final args = ModalRoute.of(context)!.settings.name!.split('/');
          final userId = int.tryParse(args[2]) ?? 0;
          return ProfileInfo(userId: userId);
        },
      },
    );

  }
}

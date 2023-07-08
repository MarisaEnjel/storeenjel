import 'package:flutter/material.dart';
import 'package:storeenjel/show_page.dart';

import 'listuser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const ShowPage(),
    );
  }
}

//https://marisaenjel.000webhostapp.com/listuser.php
import 'package:flutter/material.dart';
import 'package:ohm_pad_flutter/views/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "regular",
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0
        )
      ),
    );
  }
}


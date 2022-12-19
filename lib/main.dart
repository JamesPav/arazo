import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:arazo/models/cart_model.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';


void main() {
  runApp(const MyApp());
}

final ZoomDrawerController z = ZoomDrawerController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => CartModel(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ΦΠΑ',
      theme: ThemeData(textTheme: const TextTheme()),
      home: const MyHomePage(),
    ),
    );
  }
}


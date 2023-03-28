import 'package:flutter/material.dart';

import './pages/animated_list_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Implicit Animation',
      home: AnimatedListPage(),
    );
  }
}

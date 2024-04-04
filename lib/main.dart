import 'package:ecommerce/ui/bottom_nav.dart';
import 'package:flutter/material.dart';

void main() async => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF3F5AA6),
            title: const Text("Title text"),
          ),
          bottomNavigationBar: const BottomNav(),
        ),
      ),
    );
  }
}

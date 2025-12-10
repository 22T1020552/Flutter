import 'package:flutter/material.dart';
import 'my_drawer.dart';

class AppShell extends StatelessWidget {
  final String title;
  final Widget child;

  const AppShell({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: const MySimpleDrawer(),
      body: child,
    );
  }
}

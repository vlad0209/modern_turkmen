import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final String title;
  final bool automaticallyImplyLeading;
  const MainLayout({
    Key? key,
    required this.title,
    required this.child,
    this.automaticallyImplyLeading = false
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontSize: 30.0),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              context.go('/');
            },
          )
        ],
        automaticallyImplyLeading: automaticallyImplyLeading,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(9.0),
            child: child
        ),
      ),
    );
  }
}

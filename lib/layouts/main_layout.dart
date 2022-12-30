import 'package:flutter/material.dart';

import '../components/animated_route.dart';
import '../screens/contents_table_screen.dart';

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
              Navigator.of(context)
                  .push(AnimatedRoute.create(const ContentsTableScreen()));
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

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'language_select.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LanguageSelect(callback: () {
          context.go('/');
        },),
      ),
    );
  }
}



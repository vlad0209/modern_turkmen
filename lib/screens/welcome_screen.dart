import 'package:flutter/material.dart';
import 'package:modern_turkmen/screens/contents_table_screen.dart';
import '../widgets/language_select.dart';
import '../widgets/animated_route.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});


  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LanguageSelect(callback: () {
          Navigator.of(context).push(
              AnimatedRoute.create(const ContentsTableScreen())
          );
        },),
      ),
    );
  }
}



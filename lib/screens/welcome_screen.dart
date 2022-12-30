import 'package:flutter/material.dart';
import 'package:modern_turkmen/screens/contents_table_screen.dart';
import '../components/language_select.dart';
import '../components/animated_route.dart';

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



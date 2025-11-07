import 'package:flutter/material.dart';
import 'package:modern_turkmen/ui/widgets/contents_table_screen.dart';
import 'language_select.dart';
import '../../routes/animated_route.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});


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



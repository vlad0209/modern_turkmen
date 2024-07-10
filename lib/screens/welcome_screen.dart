import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modern_turkmen/screens/contents_table_screen.dart';
import '../widgets/language_select.dart';
import '../widgets/animated_route.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required this.firestore});
  final FirebaseFirestore firestore;


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



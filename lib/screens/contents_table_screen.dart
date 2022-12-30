import 'package:flutter/material.dart';
import 'package:modern_turkmen/components/language_selection_button.dart';
import 'package:modern_turkmen/components/tutorials_stream.dart';

class ContentsTableScreen extends StatefulWidget {
  const ContentsTableScreen({Key? key}) : super(key: key);



  
  @override
  State<ContentsTableScreen> createState() => _ContentsTableScreenState();
}

class _ContentsTableScreenState extends State<ContentsTableScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: const [LanguageSelectionButton()],
      ),
      body: SafeArea(
        child: TutorialsStream()
      ),
    );
  }
}



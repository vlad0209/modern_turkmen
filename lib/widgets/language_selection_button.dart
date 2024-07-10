import 'package:flutter/material.dart';
import 'package:modern_turkmen/models/language_data.dart';
import 'package:provider/provider.dart';

class LanguageSelectionButton extends StatelessWidget {
  const LanguageSelectionButton({super.key});

  @override
  Widget build(BuildContext context) {

    return IconButton(onPressed: () async {
      Provider.of<LanguageData>(context, listen: false).toggleLocale();
    }, icon: const Icon(Icons.language));
  }

}
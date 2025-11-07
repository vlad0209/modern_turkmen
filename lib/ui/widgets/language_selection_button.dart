import 'package:flutter/material.dart';

class LanguageSelectionButton extends StatelessWidget {
  const LanguageSelectionButton({super.key, required this.onPressed});
  final void Function() onPressed; 

  @override
  Widget build(BuildContext context) {

    return IconButton(onPressed: onPressed, icon: const Icon(Icons.language));
  }

}
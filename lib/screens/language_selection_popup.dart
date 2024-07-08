import 'package:flutter/material.dart';
import 'package:modern_turkmen/widgets/language_select.dart';

class LanguageSelectionPopup extends StatelessWidget {
  const LanguageSelectionPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white24,
      child: Container(
        padding: const EdgeInsets.all(6.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6.0),
            topRight: Radius.circular(6.0)
          )
        ),
        child: const LanguageSelect(),
      ),
    );
  }

}
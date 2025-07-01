import 'package:flutter/material.dart';
import 'package:modern_turkmen/l10n/app_localizations.dart';
import 'package:modern_turkmen/models/language_data.dart';
import 'package:provider/provider.dart';

class LanguageSelect extends StatelessWidget {

  const LanguageSelect({super.key, this.callback});
  final Function? callback;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300.0,
              child: Text(
                AppLocalizations.of(context)!.chooseLanguage,
                  style: const TextStyle(
                    fontSize: 30.0,
                  ),
                textAlign: TextAlign.center,
              ),
            ),
            MaterialButton(
              minWidth: 120,
              onPressed: () async {
                Provider.of<LanguageData>(context, listen: false).locale = const Locale('en');
                if(callback != null) {
                  callback!();
                } else {
                  Navigator.pop(context);
                }
              },
              padding: const EdgeInsets.fromLTRB(6.0, 9.0, 12.0, 9.0),
              color: Colors.white38,
              child: const Text('English', style: TextStyle(fontSize: 20.0),),
            ),
            MaterialButton(
              minWidth: 120,
              onPressed: () async {
                Provider.of<LanguageData>(context, listen: false).locale = const Locale('ru');
                if(callback != null) {
                  callback!();
                } else {
                  Navigator.pop(context);
                }
              },
              padding: const EdgeInsets.fromLTRB(6.0, 9.0, 12.0, 9.0),
              color: Colors.white38,
              child: const Text('Русский', style: TextStyle(fontSize: 20.0)),
            ),
          ],
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:modern_turkmen/l10n/app_localizations.dart';

import '../view_model/language_view_model.dart';

class LanguageSelect extends ConsumerWidget {

  const LanguageSelect({super.key, this.callback});
  final Function? callback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(languageViewModelProvider);
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
                await ref.read(languageViewModelProvider.notifier).setLanguage('en');
                if(callback != null) {
                  callback!();
                } else if(context.mounted) {
                  context.pop();
                }
              },
              padding: const EdgeInsets.fromLTRB(6.0, 9.0, 12.0, 9.0),
              color: Colors.white38,
              child: const Text('English', style: TextStyle(fontSize: 20.0),),
            ),
            const SizedBox(height: 11.0),
            MaterialButton(
              minWidth: 120,
              onPressed: () async {
                await ref.read(languageViewModelProvider.notifier).setLanguage('en');
                if(callback != null) {
                  callback!();
                } else if(context.mounted) {
                  context.pop();
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
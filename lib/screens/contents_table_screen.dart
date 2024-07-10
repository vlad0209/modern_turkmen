import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modern_turkmen/widgets/content_menu_item.dart';
import 'package:modern_turkmen/widgets/language_selection_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ContentsTableScreen extends StatelessWidget {
  const ContentsTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? localeName = AppLocalizations.of(context)?.localeName;
    final firestore = context.read<FirebaseFirestore>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: const [LanguageSelectionButton()],
      ),
      body: SafeArea(
          child: StreamBuilder<QuerySnapshot>(
        stream: firestore
            .collection('tutorials')
            .where('public_$localeName', isEqualTo: true)
            .orderBy('index')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white54,
              ),
            );
          }

          final tutorials = snapshot.data?.docs;

          List<ContentMenuItem> menuItems = [];
          for (var i = 0; i < tutorials!.length; i++) {
            var tutorial = tutorials[i];

            final menuItem = ContentMenuItem(tutorial: tutorial);
            menuItems.add(menuItem);
          }

          return OrientationBuilder(builder: (context, orientation) {
            return GridView.count(
                crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                children: menuItems);
          });
        },
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modern_turkmen/widgets/content_menu_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class TutorialsStream extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;

  TutorialsStream({super.key});

  @override
  Widget build(BuildContext context) {
    String? localeName = AppLocalizations.of(context)?.localeName;
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('tutorials').where('public_$localeName',
          isEqualTo: true).orderBy('index')
          .snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white54,
            ),
          );
        }

        final tutorials = snapshot.data?.docs;


        List<ContentMenuItem> menuItems = [];
        for(var i = 0; i < tutorials!.length; i++) {
          var tutorial = tutorials[i];

          final menuItem = ContentMenuItem(tutorial: tutorial);
          menuItems.add(menuItem);
        }

        return OrientationBuilder(
            builder: (context, orientation) {
              return GridView.count(
                  crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                  children: menuItems
              );
            }
        );



      },
    );
  }
}
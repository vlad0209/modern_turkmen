import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modern_turkmen/ui/widgets/content_menu_item.dart';
import 'package:modern_turkmen/ui/widgets/language_selection_button.dart';

import '../view_model/contents_table_view_model.dart';

class ContentsTableScreen extends ConsumerStatefulWidget {
  const ContentsTableScreen({super.key});

  @override
  ConsumerState<ContentsTableScreen> createState() => _ContentsTableScreenState();
}

class _ContentsTableScreenState extends ConsumerState<ContentsTableScreen> {
  @override
  Widget build(BuildContext context) {
    final asyncTutorials = ref.watch(contentsTableViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [LanguageSelectionButton(
          onPressed: () {
            ref.read(contentsTableViewModelProvider.notifier).toggleLocale();
            setState(() {
              // Update any local state if needed

            });
          } ,
        )],
      ),
      body: SafeArea(
          child: asyncTutorials.when(
        loading: () => const Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white54,
          ),
        ),
        error: (error, stackTrace) => Center(
          child: Text(error.toString()),
        ),
        data: (tutorials) {

          List<ContentMenuItem> menuItems = [];
          for (var i = 0; i < tutorials.length; i++) {
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

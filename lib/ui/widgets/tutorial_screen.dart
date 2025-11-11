import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:markdown_widget/config/markdown_generator.dart';
import 'package:modern_turkmen/l10n/app_localizations.dart';

import 'main_layout.dart';
import '../view_model/tutorial_view_model.dart';

class TutorialScreen extends ConsumerWidget {
  final String tutorialId;

  const TutorialScreen({super.key, required this.tutorialId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUiState = ref.watch(tutorialViewModelProvider(tutorialId));
    final localeName = Localizations.localeOf(context).languageCode;
    return asyncUiState.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => Scaffold(
        body: Center(child: Text('Error: $error')),
      ),
      data: (uiState) {
        return MainLayout(
          title: uiState.tutorial.title,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (uiState.tutorial.imageUrl?.isNotEmpty == true)
                CachedNetworkImage(
                  imageUrl: uiState.tutorial.imageUrl!,
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              if (uiState.tutorial.content != null)
                ...MarkdownGenerator().buildWidgets(uiState.tutorial.content!),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (uiState.exerciseId?.isNotEmpty == true)
                    ElevatedButton(
                        onPressed: () {
                          context.go('/tutorial/$tutorialId/exercise/$localeName/${uiState.exerciseId}');
                        },
                        child: Text(AppLocalizations.of(context)!.startExercise))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (uiState.tutorial.prevTutorialId?.isNotEmpty == true)
                    ElevatedButton(
                        onPressed: () {
                          context.go('/tutorial/${uiState.tutorial.prevTutorialId}');
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.navigate_before_sharp),
                            Text(AppLocalizations.of(context)!.prevTutorial)
                          ],
                        )),
                  if (uiState.tutorial.nextTutorialId?.isNotEmpty == true)
                    ElevatedButton(
                        onPressed: () {
                          context.go('/tutorial/${uiState.tutorial.nextTutorialId}');
                        },
                        child: Row(
                          children: [
                            Text(AppLocalizations.of(context)!.nextTutorial),
                            const Icon(Icons.navigate_next_sharp)
                          ],
                        ))
                ],
              )
            ],
          ),
        );
      }
    );
  }
}

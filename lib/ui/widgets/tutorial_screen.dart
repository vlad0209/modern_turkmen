import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modern_turkmen/l10n/app_localizations.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:modern_turkmen/routes/animated_route.dart';
import 'package:modern_turkmen/ui/widgets/exercise_screen.dart';

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
            children: [
              if (uiState.tutorial.imageUrl?.isNotEmpty == true)
                CachedNetworkImage(
                  imageUrl: uiState.tutorial.imageUrl!,
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              if (uiState.tutorial.content != null)
                Html(
                  data: uiState.tutorial.content,
                  style: {
                    "td": Style(
                      padding:
                          HtmlPaddings.symmetric(vertical: 3.0, horizontal: 3.0),
                      border: const Border(
                          bottom: BorderSide(color: Colors.purpleAccent)),
                      //display: Display.INLINE_BLOCK,
                    ),
                    "h2": Style(fontSize: FontSize(50)),
                    "h3": Style(fontSize: FontSize(40)),
                    //"body": Style(fontSize: const FontSize(30)),
                    "li em": Style(
                        padding: HtmlPaddings.only(left: 30.0),
                        display: Display.inlineBlock),
                    '.column': Style(
                      width: Width(MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? (MediaQuery.of(context).size.width / 2) - 20
                          : MediaQuery.of(context).size.width),
                      padding: HtmlPaddings.only(left: 6.0),
                    )
                  },
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (uiState.exerciseId?.isNotEmpty == true)
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(AnimatedRoute.create(
                              ExerciseScreen(
                                  exerciseId: uiState.exerciseId!,
                                  tutorialId: tutorialId,
                                  locale: localeName)));
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
                          Navigator.of(context).push(AnimatedRoute.create(
                              TutorialScreen(tutorialId: uiState.tutorial.prevTutorialId!)));
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
                          Navigator.of(context).push(AnimatedRoute.create(
                              TutorialScreen(tutorialId: uiState.tutorial.nextTutorialId!)));
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

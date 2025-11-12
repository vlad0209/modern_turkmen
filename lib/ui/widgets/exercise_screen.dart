import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:local_hero/local_hero.dart';
import 'package:modern_turkmen/l10n/app_localizations.dart';
import 'package:modern_turkmen/ui/widgets/word_card.dart';
import 'package:modern_turkmen/ui/widgets/main_layout.dart';
import 'package:modern_turkmen/ui/widgets/result_screen.dart';
import '../../config/app_constants.dart';
import '../view_model/exercise_view_model.dart';

class ExerciseScreen extends ConsumerStatefulWidget {
  final String tutorialId;
  final String exerciseId;
  final String locale;

  const ExerciseScreen(
      {super.key,
      required this.exerciseId,
      required this.tutorialId,
      required this.locale});

  @override
  ConsumerState<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends ConsumerState<ExerciseScreen> {
  bool loadingAudio = false;
  bool isOnline = true;

  @override
  void initState() {
    super.initState();
    final viewModel =
    ref
        .read(exerciseViewModelProvider(
                tutorialId: widget.tutorialId,
                exerciseId: widget.exerciseId,
                languageCode: widget.locale)
            .notifier);
    viewModel.listenOnPlayingStarted((_) {
      setState(() {
        loadingAudio = false;
      });
    });
    viewModel.listenOnPlayingCompleted((_) {
      goToNextItem();
    });
  }

  @override
  Widget build(BuildContext context) {
    final asyncUiState = ref.watch(exerciseViewModelProvider(
        tutorialId: widget.tutorialId,
        exerciseId: widget.exerciseId,
        languageCode: widget.locale));
    if (kDebugMode) {
      print("Rebuilding ExerciseScreen");
    }
    final viewModel = ref.read(exerciseViewModelProvider(
            tutorialId: widget.tutorialId,
            exerciseId: widget.exerciseId,
            languageCode: widget.locale)
        .notifier);

    return MainLayout(
        title: AppLocalizations.of(context)!.exercise,
        child: LocalHeroScope(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: asyncUiState.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(
                    child: Text(error.toString()),
                  ),
              data: (uiState) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                uiState.solvedItems.length.toString(),
                                style: const TextStyle(color: Colors.green),
                              ),
                            ),
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                uiState.notSolvedItems.length.toString(),
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                          )
                        ],
                      ),
                      Text(
                        uiState.exercise.description ?? '',
                        style: AppConstants.kBoldTextStyle,
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${AppLocalizations.of(context)!.example}: ",
                            style: AppConstants.kBoldTextStyle,
                          ),
                        ],
                      ),
                      if (uiState.exercise.exampleTranslation != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              uiState.exercise.exampleTranslation!,
                              style:
                                  const TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: parseContent(
                            uiState.exercise.example ?? '', false,
                            useKeys: false),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        height: 1,
                        color: Colors.blue,
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        uiState.exercise.items?[uiState.itemIndex]
                                .translation ??
                            '',
                        style: const TextStyle(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center,
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: parseContent(uiState.sentence, true),
                      ),
                      if (loadingAudio)
                        const Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        ),
                      if (uiState.isPlayingAudio)
                        IconButton(
                            onPressed: () {
                              viewModel.pauseAudio();
                            },
                            icon: const Icon(Icons.pause)),
                      if (uiState.isPlayingAudio == false && uiState.sentence.contains('<f/>') == false)
                        IconButton(
                            onPressed: () {
                              viewModel.resumeAudio();
                            },
                            icon: const Icon(Icons.play_arrow)),
                      const SizedBox(
                        height: 30,
                      ),
                      if (!uiState.passedItems.contains(uiState.itemIndex))
                        Column(
                          children: [
                            Text(AppLocalizations.of(context)!.choose),
                            Wrap(
                                spacing: 12,
                                runSpacing: 9,
                                children: uiState.options
                                    .map((item) => GestureDetector(
                                        onTap: () async {
                                          if (!uiState.passedItems
                                              .contains(uiState.itemIndex)) {
                                            final sentence = viewModel.chooseWord(item);
                                            if (!sentence
                                                .contains('<f/>')) {
                                              checkSentence();
                                            }
                                          }
                                        },
                                        child: LocalHero(
                                          key: Key(item),
                                          tag: item,
                                          child: WordCard(
                                            content: item,
                                          ),
                                        )))
                                    .toList()
                                    .cast()),
                          ],
                        ),
                    ],
                  ),
                );
              }),
        ));
  }

  void checkSentence() async {
    final uiState = ref.read(exerciseViewModelProvider(
        tutorialId: widget.tutorialId,
        exerciseId: widget.exerciseId,
        languageCode: widget.locale)).value!;

    String enteredSentence =
        uiState.sentence.replaceAll(RegExp(r'<f>|</f>'), '');

    final viewModel = ref.read(exerciseViewModelProvider(
            tutorialId: widget.tutorialId, exerciseId: widget.exerciseId, languageCode: widget.locale)
        .notifier);
    

    if (enteredSentence !=
        uiState.exercise.items?[uiState.itemIndex].solution) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.wrongTry)));
      Future.delayed(const Duration(seconds: 2), () {
        viewModel.resetSentence();
      });

      viewModel.markItemAsNotSolved();
    } else {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context)!.correct),
        backgroundColor: Colors.lightGreen,
      ));
      viewModel.markItemAsPassed();

      if (uiState.exercise.items?[uiState.itemIndex].sound != null &&
          isOnline) {
        setState(() {
          loadingAudio = true;
        });
        uiState.soundFuture?.then((value) {
          if (isOnline) {
            viewModel.resumeAudio();
          }
        }).timeout(const Duration(seconds: 9), onTimeout: () {
          setState(() {
            loadingAudio = false;
            isOnline = false;
          });
          goToNextItem();
        });
      } else {
        goToNextItem();
      }
    }
  }

  void goToNextItem() async {
    final provider = exerciseViewModelProvider(
        tutorialId: widget.tutorialId, exerciseId: widget.exerciseId, languageCode: widget.locale);
    final uiState = ref.read(provider).value!;
    final viewModel = ref.read(provider.notifier);

    if (viewModel.hasNextItem()) {
      viewModel.goToNextItem();
    } else {
      final nextExerciseId = await viewModel.getNextExerciseId();
      final nextTutorialId = await viewModel.getNextTutorialId();

      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          context.go('/tutorial/${widget.tutorialId}/result',
              extra: ResultParams(
                tutorialId: widget.tutorialId,
                solvedItemsCount: uiState.solvedItems.length,
                notSolvedItemsCount: uiState.notSolvedItems.length,
                nextExerciseId: nextExerciseId,
                nextTutorialId: nextTutorialId,
              ));
        }
      });
    }
  }

  List<Widget> parseContent(String content, bool animateWordCard,
      {bool useKeys = true}) {
    List<Widget> widgets = [];
    RegExp exp = RegExp(r'(<f>(.*?)</f>|<f/>|\(.*?\))');
    List<String> parts = content.split(exp);

    var matches = exp.allMatches(content).toList();
    for (var i = 0; i < parts.length; i++) {
      String part = parts[i];
      if (part.isNotEmpty) {
        widgets.add(Text(part));
      }
      if (i < matches.length) {
        if (matches[i].group(1)!.contains(RegExp(r'<f>(.*?)</f>'))) {
          final word = matches[i].group(2)!;
          final wordCard = WordCard(
            content: word,
          );
          widgets.add(LocalHero(
            key: useKeys ? Key(word) : null,
            tag: word,
            enabled: animateWordCard,
            child: wordCard,
          ));
        } else if (matches[i].group(1)!.contains(RegExp(r'<f/>'))) {
          widgets.add(const WordCard());
        } else if (matches[i].group(1)!.contains(RegExp(r'\(.*?\)'))) {
          widgets.add(Text(
            matches[i].group(1)!,
            style: const TextStyle(fontStyle: FontStyle.italic),
          ));
        }
      }
    }

    return widgets;
  }
}

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
import '../ui_state/exercise_ui_state.dart';
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
  List<LocalHero>? optionWidgets;
  List<Widget>? sentenceWidgets;

  @override
  void initState() {
    super.initState();
    final viewModel = ref.read(exerciseViewModelProvider(
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
                if (kDebugMode) {
                  print(optionWidgets);
                  print(sentenceWidgets);
                }
                optionWidgets ??= _buildOptions(uiState, viewModel);
                sentenceWidgets ??= _parseContent(uiState.sentence, true);
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
                            Expanded(
                              child: Text(
                                uiState.exercise.exampleTranslation!,
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ],
                        ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: _parseContent(
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
                          children: sentenceWidgets!),
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
                      if (uiState.isPlayingAudio == false &&
                          uiState.sentence.contains('<f/>') == false)
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
                                children: optionWidgets!
                                    .map((optionWidget) => GestureDetector(
                                          onTap: () async {
                                            if (!uiState.passedItems
                                                .contains(uiState.itemIndex)) {
                                              final optionIndex = optionWidgets!
                                                  .indexOf(optionWidget);
                                              final sentence = viewModel
                                                  .chooseWord(optionIndex);
                                              setState(() {
                                                final wordTagIndex =
                                                    sentenceWidgets!.indexWhere(
                                                        (widget) =>
                                                            widget
                                                                .runtimeType ==
                                                            WordCard);
                                                sentenceWidgets![wordTagIndex] =
                                                    optionWidget;
                                                optionWidgets!
                                                    .removeAt(optionIndex);
                                              });
                                              if (!sentence.contains('<f/>')) {
                                                checkSentence();
                                              }
                                            }
                                          },
                                          child: optionWidget,
                                        ))
                                    .toList())
                          ],
                        ),
                    ],
                  ),
                );
              }),
        ));
  }

  List<LocalHero> _buildOptions(
      ExerciseUiState uiState, ExerciseViewModel viewModel) {
    List<LocalHero> optionWidgets = [];
    Map<String, String> tagOptions = _getTagOptions(uiState);
    if (kDebugMode) {
      print(tagOptions);
    }
    for (var tag in tagOptions.keys) {
      final option = tagOptions[tag];
      optionWidgets.add(LocalHero(
        key: Key(tag),
        tag: tag,
        child: WordCard(
          content: option!,
        ),
      ));
    }
    return optionWidgets;
  }

  Map<String, String> _getTagOptions(ExerciseUiState uiState) {
    Map<String, String> tagOptions = {};
    for (var option in uiState.options) {
      String tag = option;
      int index = 1;
      while (tagOptions.containsKey(tag)) {
        tag = "$option${++index}";
      }
      tagOptions[tag] = option;
    }
    return tagOptions;
  }

  void checkSentence() async {
    final uiState = ref
        .read(exerciseViewModelProvider(
            tutorialId: widget.tutorialId,
            exerciseId: widget.exerciseId,
            languageCode: widget.locale))
        .value!;

    String enteredSentence =
        uiState.sentence.replaceAll(RegExp(r'<f>|</f>'), '');

    final viewModel = ref.read(exerciseViewModelProvider(
            tutorialId: widget.tutorialId,
            exerciseId: widget.exerciseId,
            languageCode: widget.locale)
        .notifier);

    if (enteredSentence !=
        uiState.exercise.items?[uiState.itemIndex].solution) {
      if (kDebugMode) {
        print(
            'Difference: ${enteredSentence.compareTo(uiState.exercise.items![uiState.itemIndex].solution)}');
      }
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.wrongTry)));
      Future.delayed(const Duration(seconds: 2), () {
        viewModel.resetSentence();
        setState(() {
          sentenceWidgets = null;
          optionWidgets = null;
        });
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
        tutorialId: widget.tutorialId,
        exerciseId: widget.exerciseId,
        languageCode: widget.locale);
    final viewModel = ref.read(provider.notifier);

    if (viewModel.hasNextItem()) {
      Future.delayed(Duration(seconds: 2), () {
        viewModel.goToNextItem();
        setState(() {
          optionWidgets = null;
          sentenceWidgets = null;
        });
      });
    } else {
      final nextExerciseId = await viewModel.getNextExerciseId();
      final nextTutorialId = await viewModel.getNextTutorialId();

      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          final uiState = ref.read(provider).value!;
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

  List<Widget> _parseContent(String content, bool animateWordCard,
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
          String tag = word;
          int index = 1;
          while (widgets
              .any((widget) => widget is LocalHero && widget.tag == tag)) {
            tag = "$word${++index}";
          }

          widgets.add(LocalHero(
            key: useKeys ? Key(tag) : null,
            tag: tag,
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

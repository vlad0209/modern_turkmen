import 'package:flutter/material.dart';
import 'package:modern_turkmen/routes/animated_route.dart';
import 'package:modern_turkmen/ui/widgets/main_layout.dart';
import 'package:modern_turkmen/l10n/app_localizations.dart';
import 'package:modern_turkmen/ui/widgets/exercise_screen.dart';
import 'package:modern_turkmen/ui/widgets/tutorial_screen.dart';

class ResultScreen extends StatelessWidget {
  final int solvedItemsCount;
  final int notSolvedItemsCount;
  final String tutorialId;
  final String? nextExerciseId;
  final String? nextTutorialId;

  const ResultScreen(
      {super.key,
      required this.solvedItemsCount,
      required this.notSolvedItemsCount,
      required this.tutorialId,
      this.nextExerciseId,
      this.nextTutorialId});

  @override
  Widget build(BuildContext context) {
    int percent =
        ((solvedItemsCount / (notSolvedItemsCount + solvedItemsCount)) * 100)
            .toInt();
    String rate;
    if (percent >= 80) {
      rate = AppLocalizations.of(context)!.excellent;
    } else if (percent >= 60) {
      rate = AppLocalizations.of(context)!.good;
    } else if (percent >= 40) {
      rate = AppLocalizations.of(context)!.satisfactory;
    } else {
      rate = AppLocalizations.of(context)!.bad;
    }
    return MainLayout(
        title: AppLocalizations.of(context)!.yourResult,
        child: Column(
          children: [
            Text(
              rate,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      solvedItemsCount.toString(),
                      style: const TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      notSolvedItemsCount.toString(),
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                )
              ],
            ),
            Text(AppLocalizations.of(context)!.correctAt(percent)),
            ElevatedButton(
                onPressed: () => goAHead(context),
                child: Text(AppLocalizations.of(context)!.buttonContinue))
          ],
        ));
  }

  void goAHead(BuildContext context) {
    String? localeName = AppLocalizations.of(context)?.localeName;
    if (nextExerciseId != null) {
      Navigator.of(context).push(AnimatedRoute.create(ExerciseScreen(
          exerciseId: nextExerciseId!,
          tutorialId: tutorialId,
          locale: localeName!)));
    } else if (nextTutorialId != null) {
      Navigator.of(context).push(
          AnimatedRoute.create(TutorialScreen(tutorialId: nextTutorialId!)));
    } else {
      Navigator.of(context)
          .push(AnimatedRoute.create(TutorialScreen(tutorialId: tutorialId)));
    }
  }
}

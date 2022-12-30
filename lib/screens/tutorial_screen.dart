import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:modern_turkmen/components/animated_route.dart';
import 'package:modern_turkmen/screens/exercise_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../layouts/main_layout.dart';

class TutorialScreen extends StatefulWidget {
  final String tutorialId;

  const TutorialScreen({super.key, required this.tutorialId});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  String prevTutorialId = '';
  String nextTutorialId = '';
  late Map tutorial;
  bool loaded = false;
  final CollectionReference tutorialsRef =
      FirebaseFirestore.instance.collection('tutorials');

  String exerciseId = '';

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance()
        .then((prefs) => prefs.setString('tutorialId', widget.tutorialId));

    Future.delayed(Duration.zero, () async {
      String? localeName = AppLocalizations.of(context)?.localeName;

      var tutorialSnapshot = await tutorialsRef.doc(widget.tutorialId).get();
      var data = tutorialSnapshot.data() as Map;
      setState(() {
        tutorial = data;
        loaded = true;
      });

      final prev = await tutorialsRef.orderBy('index', descending: true).where(
          'index', isLessThan: data['index']).where('public_$localeName',
          isEqualTo: true).limit(1).get();


      final next = await tutorialsRef.orderBy('index').where('index',
          isGreaterThan: data['index']).where('public_$localeName',
          isEqualTo: true).limit(1).get();
      String exercisesPath = 'tutorials/${widget.tutorialId}/exercises_$localeName';
      final exercise = await FirebaseFirestore.instance.collection(exercisesPath)
          .limit(1)
          .get();

      setState(() {
        if(prev.docs.isNotEmpty) {
          prevTutorialId = prev.docs.first.id;
        }
        if(next.docs.isNotEmpty) {
          nextTutorialId = next.docs.first.id;
        }
        if(exercise.docs.isNotEmpty) {
          exerciseId = exercise.docs.first.id;
        }

      });
    });


  }

  @override
  Widget build(BuildContext context) {
    String? localeName = AppLocalizations.of(context)?.localeName;

    if(!loaded) {
      return const Center(child: CircularProgressIndicator(),);
    }
    return MainLayout(
      title: tutorial['title_$localeName'],
      child: Column(
        children: [
          if (tutorial['image_url'] != null)
            CachedNetworkImage(
              imageUrl: tutorial['image_url'],
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          if (tutorial['content_$localeName'] != null)
            Html(
              data: tutorial['content_$localeName'],
              style: {
                "td": Style(
                  padding: const EdgeInsets.symmetric(
                      vertical: 3.0, horizontal: 3.0),
                  border: const Border(
                      bottom: BorderSide(color: Colors.purpleAccent)),
                  //display: Display.INLINE_BLOCK,
                ),
                "h2": Style(fontSize: const FontSize(50)),
                "h3": Style(fontSize: const FontSize(40)),
                //"body": Style(fontSize: const FontSize(30)),
                "li em": Style(
                    padding: const EdgeInsets.only(left: 30.0),
                    display: Display.INLINE_BLOCK),
                '.column': Style(
                  width: MediaQuery.of(context).orientation ==
                      Orientation.landscape
                      ? (MediaQuery.of(context).size.width / 2) - 20
                      : MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 6.0),
                )
              },
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(exerciseId.isNotEmpty)
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(AnimatedRoute.create(
                      ExerciseScreen(
                          exerciseId: exerciseId,
                          tutorialId: widget.tutorialId,
                          locale: localeName!
                      )
                      )
                  );
                }, child: Text(AppLocalizations.of(context)!.startExercise))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (prevTutorialId.isNotEmpty)
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(AnimatedRoute.create(
                          TutorialScreen(tutorialId: prevTutorialId))
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.navigate_before_sharp),
                        Text(AppLocalizations.of(context)!.prevTutorial)
                      ],
                    )),

              if (nextTutorialId.isNotEmpty)
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(AnimatedRoute.create(
                          TutorialScreen(tutorialId: nextTutorialId))
                      );
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
}


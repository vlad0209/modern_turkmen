import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:local_hero/local_hero.dart';
import 'package:modern_turkmen/routes/animated_route.dart';
import 'package:modern_turkmen/widgets/word_card.dart';
import 'package:modern_turkmen/layouts/main_layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modern_turkmen/screens/result_screen.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class ExerciseScreen extends StatefulWidget {
  final String tutorialId;
  final String exerciseId;
  final String locale;

  const ExerciseScreen(
      {super.key,
      required this.exerciseId,
      required this.tutorialId,
      required this.locale});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  int itemIndex = 0;
  Map<String, dynamic> data = {};
  String sentence = '';
  List options = [];
  late Future<DocumentSnapshot> snapshot;
  List solvedItems = [];
  List notSolvedItems = [];
  List passedItems = [];
  bool checking = false;
  late CollectionReference exercisesRef;
  final AudioPlayer player = AudioPlayer();
  PlayerState? playerState;
  bool loadingAudio = false;
  bool isOnline = true;
  Future? soundFuture;
  late FirebaseFirestore firestore;

  @override
  void initState() {
    super.initState();

    final AudioContext audioContext = AudioContext(
      iOS: AudioContextIOS(
        defaultToSpeaker: true,
        category: AVAudioSessionCategory.ambient,
        options: [
          AVAudioSessionOptions.defaultToSpeaker,
          AVAudioSessionOptions.mixWithOthers,
        ],
      ),
      android: AudioContextAndroid(
        isSpeakerphoneOn: true,
        stayAwake: true,
        contentType: AndroidContentType.music, // i change this
        usageType: AndroidUsageType.media, // i change this
        audioFocus: AndroidAudioFocus.gain, // i change this
      ),
    );
    AudioPlayer.global.setGlobalAudioContext(audioContext);

    player.onPlayerStateChanged.listen((event) {
      setState(() {
        playerState = event;
        loadingAudio = false;
      });
      if (event == PlayerState.completed) {
        goToNextItem();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String path = "tutorials/${widget.tutorialId}/exercises_${widget.locale}";
    firestore = context.read<FirebaseFirestore>();
    exercisesRef = firestore.collection(path);
    snapshot = exercisesRef.doc(widget.exerciseId).get();
    return MainLayout(
        title: AppLocalizations.of(context)!.exercise,
        child: LocalHeroScope(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: FutureBuilder<DocumentSnapshot>(
            future: snapshot,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text("Something went wrong");
              }

              if (snapshot.hasData && !snapshot.data!.exists) {
                return const Text("Document does not exist");
              }

              if (snapshot.connectionState == ConnectionState.done) {
                if (data.isEmpty) {
                  data = snapshot.data!.data() as Map<String, dynamic>;
                  data['items']?[itemIndex]?['options']?.shuffle();
                  sentence = data['items']?[itemIndex]?['sentence'] ?? '';
                  options = List<String>.from(
                      data['items']?[itemIndex]?['options'] ?? []);
                  final url = data['items']?[itemIndex]?['sound'];
                  if (url != null) {
                    soundFuture =
                        player.setSourceUrl(data['items'][itemIndex]['sound']);
                  }
                }

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
                                solvedItems.length.toString(),
                                style: const TextStyle(color: Colors.green),
                              ),
                            ),
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                notSolvedItems.length.toString(),
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                          )
                        ],
                      ),
                      Text(
                        data['description'] ?? '',
                        style: kBoldTextStyle,
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${AppLocalizations.of(context)!.example}: ",
                            style: kBoldTextStyle,
                          ),
                        ],
                      ),
                      if (data['example_translation'] != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              data['example_translation'],
                              style:
                                  const TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: parseContent(data['example'] ?? '', false),
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
                        data['items']?[itemIndex]?['translation'] ?? '',
                        style: const TextStyle(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center,
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: parseContent(sentence, true),
                      ),
                      if (loadingAudio)
                        const Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        ),
                      if (playerState == PlayerState.playing)
                        IconButton(
                            onPressed: () {
                              player.pause();
                            },
                            icon: const Icon(Icons.pause)),
                      if (playerState == PlayerState.paused)
                        IconButton(
                            onPressed: () {
                              player.resume();
                            },
                            icon: const Icon(Icons.play_arrow)),
                      const SizedBox(
                        height: 30,
                      ),
                      if (!passedItems.contains(itemIndex))
                        Column(
                          children: [
                            Text(AppLocalizations.of(context)!.choose),
                            Wrap(
                                spacing: 12,
                                runSpacing: 9,
                                children: options
                                    .map((item) => GestureDetector(
                                        onTap: () {
                                          if (!passedItems
                                              .contains(itemIndex)) {
                                            chooseWord(item);
                                            if (!sentence.contains('<f/>')) {
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
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ));
  }

  void chooseWord(word) {
    setState(() {
      options.remove(word);
      sentence = sentence.replaceFirst('<f/>', '<f>$word</f>');
    });
  }

  void checkSentence() async {
    String enteredSentence = sentence.replaceAll(RegExp(r'<f>|</f>'), '');

    if (enteredSentence != data['items'][itemIndex]['solution']) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.wrongTry)));
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          sentence = data['items'][itemIndex]['sentence'];
          options = List.from(data['items'][itemIndex]['options']);
        });
      });

      if (!notSolvedItems.contains(itemIndex)) {
        setState(() {
          notSolvedItems.add(itemIndex);
        });
      }
    } else {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context)!.correct),
        backgroundColor: Colors.lightGreen,
      ));
      markItemAsPassed();

      if (data['items'][itemIndex]['sound'] != null && isOnline) {
        setState(() {
          loadingAudio = true;
        });
        soundFuture?.then((value) {
          if (isOnline) {
            player.resume();
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

  void markItemAsPassed() {
    if (!notSolvedItems.contains(itemIndex)) {
      setState(() {
        solvedItems.add(itemIndex);
        passedItems.add(itemIndex);
      });
    } else {
      setState(() {
        passedItems.add(itemIndex);
      });
    }
  }

  void goToNextItem() async {
    if (itemIndex < data['items'].length - 1) {
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          itemIndex++;
          data['items'][itemIndex]['options'].shuffle();
          sentence = data['items'][itemIndex]['sentence'];
          options = List.from(data['items'][itemIndex]['options']);
          soundFuture = player.setSourceUrl(data['items'][itemIndex]['sound']);
          checking = false;
        });
      });
    } else {
      var nextExerciseSnapshot =
          await exercisesRef.startAfterDocument(await snapshot).limit(1).get();
      String? nextExerciseId;
      String? nextTutorialId;
      if (nextExerciseSnapshot.docs.isNotEmpty) {
        nextExerciseId = nextExerciseSnapshot.docs.first.id;
      } else {
        final CollectionReference tutorialsRef =
            firestore.collection('tutorials');
        final next = await tutorialsRef
            .orderBy('index')
            .where('public_${widget.locale}', isEqualTo: true)
            .startAfterDocument(await tutorialsRef.doc(widget.tutorialId).get())
            .limit(1)
            .get();

        if (next.docs.isNotEmpty) {
          nextTutorialId = next.docs.first.id;
        }
      }

      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).push(AnimatedRoute.create(ResultScreen(
          tutorialId: widget.tutorialId,
          solvedItemsCount: solvedItems.length,
          notSolvedItemsCount: notSolvedItems.length,
          nextExerciseId: nextExerciseId,
          nextTutorialId: nextTutorialId,
        )));
      });
    }
  }

  List<Widget> parseContent(String content, bool animateWordCard) {
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
            key: Key(word),
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

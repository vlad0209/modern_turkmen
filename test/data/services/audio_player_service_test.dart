import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:modern_turkmen/data/services/audio_player_service.dart';
import 'audio_player_service_test.mocks.dart';

@GenerateMocks([AudioPlayer])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  
  setUpAll(() {
    // Mock the AudioPlayers global channel to prevent MissingPluginException
    const globalChannel = MethodChannel('xyz.luan/audioplayers.global');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(globalChannel, (methodCall) async {
      switch (methodCall.method) {
        case 'init':
        case 'setAudioContext':
          return null;
        default:
          return null;
      }
    });
  });
  group('AudioPlayerService', () {
    late MockAudioPlayer mockAudioPlayer;
    late AudioPlayerService audioPlayerService;

    setUp(() {
      mockAudioPlayer = MockAudioPlayer();
      audioPlayerService = AudioPlayerService(mockAudioPlayer);
    });

    test('constructor sets audio context', () {
      // The constructor should complete without throwing
      expect(audioPlayerService, isNotNull);
    });

    test('onPlayingCompleted returns player complete stream', () {
      final completeStream = Stream<void>.empty();
      when(mockAudioPlayer.onPlayerComplete).thenAnswer((_) => completeStream);

      expect(audioPlayerService.onPlayingCompleted, equals(completeStream));
    });

    test('onPlayingStarted filters playing state', () async {
      final stateController = StreamController<PlayerState>();
      when(mockAudioPlayer.onPlayerStateChanged).thenAnswer((_) => stateController.stream);

      final playingEvents = <void>[];
      audioPlayerService.onPlayingStarted.listen((_) => playingEvents.add(null));

      stateController.add(PlayerState.paused);
      stateController.add(PlayerState.playing);
      stateController.add(PlayerState.stopped);
      stateController.add(PlayerState.playing);

      // Wait for stream events to be processed
      await Future.delayed(const Duration(milliseconds: 10));

      expect(playingEvents, hasLength(2));
      
      stateController.close();
    });

    test('setSourceUrl calls audio player setSourceUrl', () async {
      const url = 'https://example.com/audio.mp3';
      when(mockAudioPlayer.setSourceUrl(url)).thenAnswer((_) async {});

      await audioPlayerService.setSourceUrl(url);

      verify(mockAudioPlayer.setSourceUrl(url)).called(1);
    });

    test('pauseAudio calls audio player pause', () async {
      when(mockAudioPlayer.pause()).thenAnswer((_) async {});

      await audioPlayerService.pauseAudio();

      verify(mockAudioPlayer.pause()).called(1);
    });

    test('resumeAudio calls audio player resume', () async {
      when(mockAudioPlayer.resume()).thenAnswer((_) async {});

      await audioPlayerService.resumeAudio();

      verify(mockAudioPlayer.resume()).called(1);
    });
  });
}
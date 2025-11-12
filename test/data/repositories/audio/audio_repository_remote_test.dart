import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modern_turkmen/data/repositories/audio/audio_repository_remote.dart';
import 'package:modern_turkmen/data/services/audio_player_service.dart';

import 'audio_repository_remote_test.mocks.dart';

@GenerateMocks([AudioPlayerService])
void main() {
  late AudioRepositoryRemote repository;
  late MockAudioPlayerService mockAudioPlayerService;

  setUp(() {
    mockAudioPlayerService = MockAudioPlayerService();
    repository = AudioRepositoryRemote(audioPlayerService: mockAudioPlayerService);
  });

  group('AudioRepositoryRemote', () {
    test('constructor should initialize with audio player service', () {
      expect(repository, isNotNull);
    });

    test('onPlayingCompleted should return stream from audio player service', () {
      final stream = Stream<void>.empty();
      when(mockAudioPlayerService.onPlayingCompleted).thenAnswer((_) => stream);

      expect(repository.onPlayingCompleted, equals(stream));
      verify(mockAudioPlayerService.onPlayingCompleted).called(1);
    });

    test('onPlayingStarted should return stream from audio player service', () {
      final stream = Stream<void>.empty();
      when(mockAudioPlayerService.onPlayingStarted).thenAnswer((_) => stream);

      expect(repository.onPlayingStarted, equals(stream));
      verify(mockAudioPlayerService.onPlayingStarted).called(1);
    });

    test('setSourceUrl should call audio player service setSourceUrl', () async {
      const url = 'https://example.com/audio.mp3';
      when(mockAudioPlayerService.setSourceUrl(url)).thenAnswer((_) async {});

      await repository.setSourceUrl(url);

      verify(mockAudioPlayerService.setSourceUrl(url)).called(1);
    });

    test('pauseAudio should call audio player service pauseAudio', () async {
      when(mockAudioPlayerService.pauseAudio()).thenAnswer((_) async {});

      await repository.pauseAudio();

      verify(mockAudioPlayerService.pauseAudio()).called(1);
    });

    test('resumeAudio should call audio player service resumeAudio', () async {
      when(mockAudioPlayerService.resumeAudio()).thenAnswer((_) async {});

      await repository.resumeAudio();

      verify(mockAudioPlayerService.resumeAudio()).called(1);
    });
  });
}
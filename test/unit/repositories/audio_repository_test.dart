import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/repositories/audio_repository.dart';

void main() {
  group('AudioRepository', () {
    late AudioRepository audioRepository;

    setUp(() {
      audioRepository = AudioRepository();
    });

    test('should return a list of audio files', () async {
      final audioFiles = await audioRepository.getAudioFiles();
      expect(audioFiles, isA<List<String>>());
    });

    test('should play audio file', () async {
      final result = await audioRepository.playAudio('test_audio.mp3');
      expect(result, isTrue);
    });

    test('should pause audio playback', () async {
      final result = await audioRepository.pauseAudio();
      expect(result, isTrue);
    });

    test('should stop audio playback', () async {
      final result = await audioRepository.stopAudio();
      expect(result, isTrue);
    });
  });
}
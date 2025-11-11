import 'package:flutter_test/flutter_test.dart';
import 'package:modern_turkmen/services/audio_player_service.dart';

void main() {
  group('AudioPlayerService', () {
    late AudioPlayerService audioPlayerService;

    setUp(() {
      audioPlayerService = AudioPlayerService();
    });

    test('should play audio', () {
      audioPlayerService.play('test_audio.mp3');
      expect(audioPlayerService.isPlaying, true);
    });

    test('should pause audio', () {
      audioPlayerService.play('test_audio.mp3');
      audioPlayerService.pause();
      expect(audioPlayerService.isPlaying, false);
    });

    test('should stop audio', () {
      audioPlayerService.play('test_audio.mp3');
      audioPlayerService.stop();
      expect(audioPlayerService.isPlaying, false);
    });
  });
}
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerService {
  final AudioPlayer _audioPlayer;
  AudioPlayerService(this._audioPlayer) {
    final AudioContext audioContext = AudioContext(
      iOS: AudioContextIOS(
        category: AVAudioSessionCategory.playback,
        options: const {
          AVAudioSessionOptions.mixWithOthers,
        }
      ),
      android: const AudioContextAndroid(
        isSpeakerphoneOn: true,
        stayAwake: true,
        contentType: AndroidContentType.speech, 
        usageType: AndroidUsageType.media, 
        audioFocus: AndroidAudioFocus.gain, 
      ),
    );
    AudioPlayer.global.setAudioContext(audioContext);
  }

  Stream<void> get onPlayingCompleted => _audioPlayer.onPlayerComplete;

  Future? setSourceUrl(String url) => _audioPlayer.setSourceUrl(url);

  Future<void> pauseAudio() => _audioPlayer.pause();

  Future<void> resumeAudio() => _audioPlayer.resume();
}
import 'package:modern_turkmen/data/repositories/audio/audio_repository.dart';

import '../../services/audio_player_service.dart';

class AudioRepositoryRemote implements AudioRepository {
  final AudioPlayerService _audioPlayerService;

  AudioRepositoryRemote({required AudioPlayerService audioPlayerService}) : _audioPlayerService = audioPlayerService;
  
  @override
  Stream<void> get onPlayingCompleted => _audioPlayerService.onPlayingCompleted;
  
  @override
  Future? setSourceUrl(String url) {
    return _audioPlayerService.setSourceUrl(url);
  }
  
  @override
  Future<void> pauseAudio() => _audioPlayerService.pauseAudio();
  
  @override
  Future<void> resumeAudio() {
    return _audioPlayerService.resumeAudio();
  }
}
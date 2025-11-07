abstract class AudioRepository {
  Stream<void> get onPlayingCompleted;

  Future? setSourceUrl(String url);

  Future<void> pauseAudio();

  Future<void> resumeAudio();
}
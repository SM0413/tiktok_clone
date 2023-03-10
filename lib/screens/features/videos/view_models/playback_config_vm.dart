import 'package:flutter/material.dart';
import 'package:tictok_clone/screens/features/videos/models/playback_config_model.dart';
import 'package:tictok_clone/screens/features/videos/repos/video_playback_config_repo.dart';

class PlaybackConfigViewModel extends ChangeNotifier {
  final PlaybackConfigRepository _repository;

  late final PlayBackConfigModel _model = PlayBackConfigModel(
      muted: _repository.isMuted(), autoplay: _repository.isAutoplay());

  PlaybackConfigViewModel(this._repository);

  bool get muted => _model.muted;

  bool get autoplay => _model.autoplay;

  void setMuted(bool value) {
    _repository.setMuted(value);
    _model.muted = value;
    notifyListeners();
  }

  void setAutoplay(bool value) {
    _repository.setAutoplay(value);
    _model.autoplay = value;
    notifyListeners();
  }
}

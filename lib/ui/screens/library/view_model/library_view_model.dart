import 'package:flutter/material.dart';
import 'package:weel7_small_hw/data/repositories/songs/song_repository.dart';
import 'package:weel7_small_hw/model/settings/app_settings.dart';
import 'package:weel7_small_hw/model/songs/song.dart';
import 'package:weel7_small_hw/ui/states/player_state.dart';
import 'package:weel7_small_hw/ui/states/settings_state.dart';

class LibraryViewModel extends ChangeNotifier {

  // final Song songs;
  final SongRepository songRepository;
  final PlayerState playerState;
  final AppSettingsState settingsState;

  List<Song> _song = [];

  LibraryViewModel({
    // required this.songs,
    required this.songRepository,
    required this.playerState,
    required this.settingsState,
  }) {
    playerState.addListener(notifyListeners);
    settingsState.addListener(notifyListeners);
    init();
  }

  void init() {
    _song = songRepository.fetchSongs();
    notifyListeners();
  }

  List<Song> get songs => _song;
  ThemeColor get theme => settingsState.theme;
  bool isPlaying(Song song) => playerState.currentSong == song;

  void playSong(Song song) {
    playerState.start(song);
  }

  void stopSong() {
    playerState.stop();
  }

  @override
  void dispose() {
    playerState.removeListener(notifyListeners);
    settingsState.removeListener(notifyListeners);
    super.dispose();
  }
}
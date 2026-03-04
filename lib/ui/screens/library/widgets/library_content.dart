import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weel7_small_hw/data/repositories/songs/song_repository.dart';
import 'package:weel7_small_hw/model/songs/song.dart';
import 'package:weel7_small_hw/ui/states/player_state.dart';
import 'package:weel7_small_hw/ui/states/settings_state.dart';
import 'package:weel7_small_hw/ui/theme/theme.dart';
import 'package:weel7_small_hw/ui/widgets/song_tile.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {
    // 1- Read the globbal song repository
    SongRepository songRepository = context.read<SongRepository>();
    List<Song> songs = songRepository.fetchSongs();

    // 2- Read the globbal settings state
    AppSettingsState settingsState = context.read<AppSettingsState>();

    // 3 - Watch the globbal player state
    PlayerState playerState = context.watch<PlayerState>();

    return Container(
      color: settingsState.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Library", style: AppTextStyles.heading),

          SizedBox(height: 50),

          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) => SongTile(
                song: songs[index],
                isPlaying: playerState.currentSong == songs[index],
                onTap: () {
                  playerState.start(songs[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
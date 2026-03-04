import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weel7_small_hw/data/repositories/songs/song_repository.dart';
import 'package:weel7_small_hw/model/songs/song.dart';
import 'package:weel7_small_hw/ui/states/player_state.dart';
import 'package:weel7_small_hw/ui/widgets/song_tile.dart';
import 'package:weel7_small_hw/ui/states/settings_state.dart';
import 'package:weel7_small_hw/ui/theme/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    SongRepository songRepository = context.read<SongRepository>();
    List<Song> songs = songRepository.fetchSongs();
    AppSettingsState settingsState = context.read<AppSettingsState>();
    PlayerState playerState = context.read<PlayerState>();

    return Container(
      color: settingsState.theme.backgroundColor,
      child: Column(
        children: [
          Text('You might also like', style: TextStyle(color: AppColors.neutralLight, fontSize: 20),),
          SizedBox(height: 15,),
          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return SongTile(
                  song: songs[index],
                  isPlaying: playerState.currentSong == songs[index],
                );
              },
            ),
          ),
          Text('You might also like', style: TextStyle(color: AppColors.neutralLight, fontSize: 20),),
          SizedBox(height: 15,),
          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return SongTile(
                  song: songs[index],
                  isPlaying: playerState.currentSong == songs[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
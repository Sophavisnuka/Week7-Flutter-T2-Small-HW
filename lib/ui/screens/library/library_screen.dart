import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weel7_small_hw/data/repositories/songs/song_repository.dart';
import 'package:weel7_small_hw/ui/screens/library/view_model/library_view_model.dart';
import 'package:weel7_small_hw/ui/screens/library/widgets/library_content.dart';
import 'package:weel7_small_hw/ui/states/player_state.dart';
import 'package:weel7_small_hw/ui/states/settings_state.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LibraryViewModel(
        songRepository: context.read<SongRepository>(),
        playerState: context.read<PlayerState>(),
        settingsState: context.read<AppSettingsState>(),
      ),
      child: const LibraryContent(),
    );
  }
}
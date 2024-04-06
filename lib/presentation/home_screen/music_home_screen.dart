import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player_nymble/controllers/music_cubit/music_cubit.dart';
import 'package:music_player_nymble/models/music_model.dart';
import 'package:music_player_nymble/presentation/home_screen/widgets/music_item_widget.dart';

class MusicHomeScreen extends StatefulWidget {
  const MusicHomeScreen({super.key});

  @override
  State<MusicHomeScreen> createState() => _MusicHomeScreenState();
}

class _MusicHomeScreenState extends State<MusicHomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<MusicHomeCubit>(context, listen: false)
          .fetchAllMusic(artistName: "Shreya Ghoshal");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Music player "),
      ),
      body: BlocBuilder<MusicHomeCubit, MusicHomeState>(
          builder: (context, state) {
        if (state is MusicHomeStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MusicHomeStateFailed) {
          return Center(child: Text(state.errorMessage));
        }
        if (state is MusicHomeStateSuccess ||
            state is MusicListPaginationLoading) {
          List<MusicModel> musicListData = [];

          if (state is MusicHomeStateSuccess) {
            musicListData = state.musicList;
          } else if (state is MusicListPaginationLoading) {
            musicListData = state.musicList;
          }

          return NotificationListener<ScrollNotification>(
            onNotification: (value) {
              if (value.metrics.pixels >= value.metrics.maxScrollExtent - 200) {
                // if loading, return false;
                if (state is MusicListPaginationLoading) return false;
                print("-- loading x y");
                BlocProvider.of<MusicHomeCubit>(context, listen: false)
                    .fetchAllMusic(artistName: 'Shreya Ghoshal');
                return true;
              }

              return false;
            },
            child: ListView.builder(
              itemCount: musicListData.length,
              itemBuilder: (context, index) {
                final musicItem = musicListData[index];
                return MusicItemWidget(
                  musicModel: musicItem,
                  isLoading: index == musicListData.length - 1 &&
                      state is MusicListPaginationLoading,
                );
              },
            ),
          );
        }
        return const Center(
          child: Text('No data'),
        );
      }),
    );
  }
}

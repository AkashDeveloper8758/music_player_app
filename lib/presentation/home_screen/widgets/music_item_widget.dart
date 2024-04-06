import 'package:flutter/material.dart';
import 'package:music_player_nymble/models/music_model.dart';

class MusicItemWidget extends StatelessWidget {
  final MusicModel musicModel;
  final bool isLoading;
  const MusicItemWidget(
      {super.key, required this.musicModel, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // BlocProvider.of<MusicHomeCubit>(context, listen: false)
        //     .getUsersList(userId: musicModel.userId);
      },
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    minRadius: 28,
                    backgroundImage: NetworkImage(musicModel.artworkUrl100),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${musicModel.trackName} ",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        Text(musicModel.artistName),
                      ],
                    ),
                  )
                ],
              )),
          if (isLoading)
            const SizedBox(
              height: 56,
              width: 56,
              child: Center(child: CircularProgressIndicator()),
            )
        ],
      ),
    );
  }
}

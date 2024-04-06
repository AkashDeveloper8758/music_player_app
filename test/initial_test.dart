import 'package:flutter_test/flutter_test.dart';
import 'package:music_player_nymble/models/music_model.dart';
import 'package:music_player_nymble/repository/music_repository.dart';
import 'package:music_player_nymble/utils/resources/data_state.dart';

void main() {
  group('fetchMusic', () {
    test('returns a non-empty list of music', () async {
      //prepare
      MusicRepository musicRepository = MusicRepositoryImpl();

      final DataState<List<MusicModel>> response =
          await musicRepository.fetchMusic(query:'Michael Jackson');
      expect(response.data, isNotNull);
      expect(response.data, isNotEmpty);
    });
  });
}
 
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_player_nymble/models/music_model.dart';
import 'package:music_player_nymble/repository/music_repository.dart';
import 'package:music_player_nymble/utils/constants/error_constants.dart';
import 'package:music_player_nymble/utils/resources/data_state.dart';

part 'music_states.dart';

class MusicHomeCubit extends Cubit<MusicHomeState> {
  final MusicRepository _apiRepositories;
  MusicHomeCubit(this._apiRepositories) : super(MusicHomeStateInitial());

  var _isMoreAvailable = true;
  final List<MusicModel> _musicList = [];
  final int _limit = 10;

  Future fetchAllMusic({required String artistName}) async {
    try {
      if (_musicList.isEmpty) {
        _isMoreAvailable = true;
      }
      if (!_isMoreAvailable) return;

      if (_musicList.isNotEmpty) {
        emit(MusicListPaginationLoading(musicList: _musicList));
      } else {
        emit(MusicHomeStateLoading());
      }

      final musicListResponse = await _apiRepositories.fetchMusic(
          query: artistName, limit: _limit, offset: _musicList.length);

      //* make _isMoreAvailable to false when there is error or not data came from the api.
      if (musicListResponse.data == null || musicListResponse.data!.isEmpty) {
        _isMoreAvailable = false;
      }
      if (musicListResponse is DataFailed) {
        emit(MusicHomeStateFailed(errorMessage: musicListResponse.error));
        return;
      }
      _musicList.addAll(musicListResponse.data ?? []);
      emit(MusicHomeStateSuccess(musicList: _musicList.toList()));
      // emit(MusicHomeStateSuccess(musicList: _musicList));
    } catch (err) {
      emit(const MusicHomeStateFailed(
          errorMessage: ErrorMessagesConstants.somethingWentWrong));
    }
  }
}

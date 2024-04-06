import 'dart:convert';

import 'package:music_player_nymble/models/music_model.dart';
import 'package:music_player_nymble/services/api_service.dart';
import 'package:music_player_nymble/utils/resources/data_state.dart';

abstract class MusicRepository {
  Future<DataState<List<MusicModel>>> fetchMusic(
      {required String query, int? limit, int? offset});
}

class MusicRepositoryImpl extends MusicRepository {
  final _dioInstance = ApiService().instance;

  @override
  Future<DataState<List<MusicModel>>> fetchMusic(
      {required String query, int? limit, int? offset}) async {
    String apiUrl = 'https://itunes.apple.com/search?term=$query&entity=song';
    if (limit != null) {
      apiUrl += '&limit=$limit';
    }
    if (offset != null) {
      apiUrl += '&offset=$offset';
    }
    try {
      final response = await _dioInstance.get(apiUrl);
      // print("response data : ${response.data} ");
      if (response.statusCode == 200) {
        String customResoponse = (response.data as String).trim();
        final List<dynamic> decodedJson =
            jsonDecode(customResoponse)['results'];

        if (decodedJson.isNotEmpty) {
          List<MusicModel> musicList =
              decodedJson.map((json) => MusicModel.fromJson(json)).toList();
          return DataSuccess(data: musicList);
        }
      }
      return const DataFailed(error: 'No music found');
    } catch (error) {
      print('Error fetching music: $error');
      return const DataFailed(error: 'Something went wrong ');
    }
  }
}

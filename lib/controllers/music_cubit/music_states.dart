part of 'music_cubit.dart';

abstract class MusicHomeState extends Equatable {
  const MusicHomeState();

  @override
  List<Object> get props => [];
}

class MusicHomeStateInitial extends MusicHomeState {}

class MusicHomeStateLoading extends MusicHomeState {}

class MusicHomeStateSuccess extends MusicHomeState {
  final List<MusicModel> musicList;
  const MusicHomeStateSuccess({required this.musicList});
}

class MusicHomeStateFailed extends MusicHomeState {
  final String errorMessage;
  const MusicHomeStateFailed({required this.errorMessage});
}

class MusicListPaginationLoading extends MusicHomeState {
  final List<MusicModel> musicList;
  const MusicListPaginationLoading({required this.musicList});
}

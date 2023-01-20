part of 'home_cubit.dart';

enum HomeStatus { loading, sucess, error }

class HomeState {
  HomeState({
    this.gifs = const [],
    this.status = HomeStatus.loading,
  });
  final List<GifModel> gifs;
  final HomeStatus status;

  HomeState copyWith({List<GifModel>? gifs, HomeStatus? status}) {
    return HomeState(
      gifs: gifs ?? this.gifs,
      status: status ?? this.status,
    );
  }
}

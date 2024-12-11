
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/core/entity/trailer.dart';
import 'package:movie_app_flutter/domain/movie/usecases/get_movie_trailer.dart';
import 'package:movie_app_flutter/presentation/watch/bloc/trailer_state.dart';
import 'package:movie_app_flutter/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoading());

  void getMovieTrailer(int movieId) async {
    var returnedData = await sl<GetMovieTrailerUseCase>().call(
      params: movieId,
    );
    returnedData.fold((error) {
      emit(FailureLoadTrailer(errorMessage: error));
    }, (data) async {
      TrailerEntity trailerEntity = data;
      YoutubePlayerController controller = YoutubePlayerController(
        initialVideoId: trailerEntity.key!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ),
      );
      emit(TrailerLoaded(youtubePlayerController: controller));
    });
  }
}
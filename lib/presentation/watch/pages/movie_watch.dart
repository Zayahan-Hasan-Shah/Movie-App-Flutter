import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/widgets/appbar/app_bar.dart';
import 'package:movie_app_flutter/domain/movie/entities/movie.dart';
import 'package:movie_app_flutter/presentation/watch/widgets/recommendation_movies.dart';
import 'package:movie_app_flutter/presentation/watch/widgets/similar_movies.dart';
import 'package:movie_app_flutter/presentation/watch/widgets/video_overview.dart';
import 'package:movie_app_flutter/presentation/watch/widgets/video_player.dart';
import 'package:movie_app_flutter/presentation/watch/widgets/video_release_date.dart';
import 'package:movie_app_flutter/presentation/watch/widgets/video_title.dart';
import 'package:movie_app_flutter/presentation/watch/widgets/video_vote_average.dart';

class MovieWatchPage extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieWatchPage({
    required this.movieEntity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(id: movieEntity.id!),
            const SizedBox(
              height: 10,
            ),
            VideoTitle(title: movieEntity.title!),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoReleaseDate(videoReleaseDate: movieEntity.releaseDate!),
                VidoeVoteAverage(voteAverage: movieEntity.voteAverage!),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            VideoOverview(overview: movieEntity.overview!),
            const SizedBox(
              height: 10,
            ),
            RecommendationMovies(
              movieId: movieEntity.id!,
            ),
            const SizedBox(
              height: 10,
            ),
            SimilarMovies(movieId: movieEntity.id!),
          ],
        ),
      ),
    );
  }
}

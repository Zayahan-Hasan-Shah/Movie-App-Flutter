import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/widgets/appbar/app_bar.dart';
import 'package:movie_app_flutter/domain/tv/entities/tv.dart';
import 'package:movie_app_flutter/presentation/watch/widgets/recommendation_tvs.dart';
import 'package:movie_app_flutter/presentation/watch/widgets/similar_tv.dart';
import 'package:movie_app_flutter/presentation/watch/widgets/tv_keywords.dart';
import 'package:movie_app_flutter/presentation/watch/widgets/video_overview.dart';
import 'package:movie_app_flutter/presentation/watch/widgets/video_player.dart';
import 'package:movie_app_flutter/presentation/watch/widgets/video_title.dart';
import 'package:movie_app_flutter/presentation/watch/widgets/video_vote_average.dart';

class TvWatchPage extends StatelessWidget {
  final TVEntity tvEntity;
  const TvWatchPage({
    required this.tvEntity,
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
            VideoPlayer(id: tvEntity.id!),
            const SizedBox(
              height: 10,
            ),
            VideoTitle(title: tvEntity.name!),
            const SizedBox(
              height: 10,
            ),
            TVKeyowrds(tvId: tvEntity.id!),
            const SizedBox(
              height: 10,
            ),
            VidoeVoteAverage(voteAverage: tvEntity.voteAverage!),
            const SizedBox(
              height: 10,
            ),
            VideoOverview(overview: tvEntity.overview!),
            const SizedBox(
              height: 10,
            ),
            RecommendationTVs(
              tvId: tvEntity.id!,
            ),
            const SizedBox(
              height: 10,
            ),
            SimilarTVs(tvId: tvEntity.id!),
          ],
        ),
      ),
    );
  }
}

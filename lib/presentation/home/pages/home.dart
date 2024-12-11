import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_flutter/common/helper/navigation/app_navigation.dart';
import 'package:movie_app_flutter/common/widgets/appbar/app_bar.dart';
import 'package:movie_app_flutter/presentation/home/widgets/category_text.dart';
import 'package:movie_app_flutter/presentation/home/widgets/now_playing_movies.dart';
import 'package:movie_app_flutter/presentation/home/widgets/popular_tv.dart';
import 'package:movie_app_flutter/presentation/home/widgets/trendings_movies.dart';
import 'package:movie_app_flutter/presentation/search/pages/search.dart';
import '../../../core/configs/assets/app_vectors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: SvgPicture.asset(AppVectors.logo),
        action: IconButton(
          onPressed: () {
            AppNavigator.push(context, const SearchPage());
          },
          icon: const Icon(
            Icons.search,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryText(title: 'Trending 🔥'),
            SizedBox(
              height: 16,
            ),
            TrendingMovies(),
            SizedBox(
              height: 16,
            ),
            CategoryText(title: 'Now Playing'),
            SizedBox(
              height: 16,
            ),
            NowPlayingMovies(),
            SizedBox(
              height: 16,
            ),
            CategoryText(title: 'Popular TV'),
            SizedBox(
              height: 16,
            ),
            PopularTv(),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}

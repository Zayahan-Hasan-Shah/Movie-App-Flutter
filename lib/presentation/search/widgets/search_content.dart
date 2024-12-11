import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/common/widgets/movie/movie_card.dart';
import 'package:movie_app_flutter/common/widgets/tv/tv_card.dart';
import 'package:movie_app_flutter/presentation/search/bloc/search_cuibt.dart';
import 'package:movie_app_flutter/presentation/search/bloc/search_state.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MoviesLoaded) {
          return GridView.builder(
            shrinkWrap: true,
            itemCount: state.movies.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              return MovieCard(movieEntity: state.movies[index]);
            },
          );
        }
        if (state is TVsLoaded) {
          return GridView.builder(
            itemCount: state.tvs.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              return TVCard(tvEntity: state.tvs[index]);
            },
          );
        }

        if (state is SearchFailure) {
          return Center(child: Text(state.errorMessage));
        }

        return Container();
      },
    );
  }
}

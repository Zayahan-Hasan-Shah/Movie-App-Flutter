import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/common/bloc/generic_data_cubit.dart';
import 'package:movie_app_flutter/common/bloc/generic_data_state.dart';
import 'package:movie_app_flutter/common/widgets/tv/tv_card.dart';
import 'package:movie_app_flutter/domain/tv/entities/tv.dart';
import 'package:movie_app_flutter/domain/tv/usecases/get_recommendation_tv.dart';
import 'package:movie_app_flutter/service_locator.dart';

class RecommendationTVs extends StatelessWidget {
  final int tvId;
  const RecommendationTVs({super.key, required this.tvId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<TVEntity>>(sl<GetRecommendationTVsUseCase>(),
            params: tvId),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is DataLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Recommendation',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return TVCard(tvEntity: state.data[index]);
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemCount: state.data.length,
                  ),
                ),
              ],
            );
          }
          if (state is FailureLoadData) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}
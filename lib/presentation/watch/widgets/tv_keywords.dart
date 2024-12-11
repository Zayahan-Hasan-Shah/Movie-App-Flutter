import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/common/bloc/generic_data_cubit.dart';
import 'package:movie_app_flutter/common/bloc/generic_data_state.dart';
import 'package:movie_app_flutter/core/entity/keyword.dart';
import 'package:movie_app_flutter/domain/tv/usecases/get_keywords.dart';
import 'package:movie_app_flutter/service_locator.dart';

class TVKeyowrds extends StatelessWidget {
  final int tvId;
  const TVKeyowrds({super.key, required this.tvId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<KeywordEntity>>(sl<GetTVKeywordsUseCase>(),
            params: tvId),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is DataLoaded) {
            List<KeywordEntity> keywords = state.data;
            return Wrap(
              spacing: 5,
              children: keywords
                  .map(
                    (item) => Chip(
                      label: Text(item.name!),

                    ),
                  )
                  .toList(),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/presentation/search/bloc/search_cuibt.dart';
import 'package:movie_app_flutter/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:movie_app_flutter/presentation/search/widgets/selectable_option.dart';

class SearchOptions extends StatelessWidget {
  const SearchOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectableOptionCubit, SearchType>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableOption(
              title: 'Movie',
              onTap: () {
                context.read<SelectableOptionCubit>().selectMovie();
                context.read<SearchCubit>().search(
                      context.read<SearchCubit>().textEditingController.text,
                      context.read<SelectableOptionCubit>().state,
                    );
              },
              isSelected: context.read<SelectableOptionCubit>().state ==
                  SearchType.movie,
            ),
            const SizedBox(
              width: 16,
            ),
            SelectableOption(
              title: 'TV',
              onTap: () {
                context.read<SelectableOptionCubit>().selectTV();
                context.read<SearchCubit>().search(
                      context.read<SearchCubit>().textEditingController.text,
                      context.read<SelectableOptionCubit>().state,
                    );
              },
              isSelected:
                  context.read<SelectableOptionCubit>().state == SearchType.tv,
            ),
          ],
        );
      },
    );
  }
}

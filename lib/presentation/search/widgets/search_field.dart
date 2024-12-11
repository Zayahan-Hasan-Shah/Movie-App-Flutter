import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/presentation/search/bloc/search_cuibt.dart';
import 'package:movie_app_flutter/presentation/search/bloc/selectable_option_cubit.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: context.read<SearchCubit>().textEditingController,
      onChanged: (value) {
        context.read<SearchCubit>().search(
              value,
              context.read<SelectableOptionCubit>().state,
            );
      },
      decoration: const InputDecoration(
        hintText: 'Search...',
      ),
    );
  }
}

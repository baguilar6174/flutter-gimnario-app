import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gimnario_app/core/core.dart';
import 'package:flutter_gimnario_app/features/features.dart';

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: CustomAppBar(title: Strings.of(context)!.exercise),
      child: RefreshIndicator(
        onRefresh: () => context.read<ExercisesCubit>().fetchExercises(),
        child: BlocBuilder<ExercisesCubit, ExerciseState>(
          builder: (_, state) {
            if (state is InitialState) {
              return const SizedBox.shrink();
            }
            if (state is LoadingState) {
              return const Center(child: Loading());
            }
            if (state is SuccessState) {
              return ListView.builder(
                // controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: state.exercises.length,
                padding: EdgeInsets.symmetric(vertical: Dimens.space16),
                itemBuilder: (_, index) {
                  return index < (state.exercises.length)
                      ? Text(state.exercises[index].name)
                      : Padding(
                          padding: EdgeInsets.all(Dimens.space16),
                          child: const Center(
                            child: CupertinoActivityIndicator(),
                          ),
                        );
                },
              );
            }
            if (state is EmptyState) {
              return const Center(child: Empty());
            }
            return const Center(child: Empty(errorMessage: "message"));
          },
        ),
      ),
    );
  }
}

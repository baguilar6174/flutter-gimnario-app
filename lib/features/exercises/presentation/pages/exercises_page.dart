import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gimnario_app/core/core.dart';
import 'package:flutter_gimnario_app/features/features.dart';
import 'package:gif_view/gif_view.dart';

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: CustomAppBar(title: Strings.of(context)!.exercise),
      child: RefreshIndicator(
        color: Theme.of(context).extension<AppColors>()!.pink,
        backgroundColor: Theme.of(context).extension<AppColors>()!.background,
        onRefresh: () => context.read<ExercisesCubit>().fetchExercises(),
        child: BlocBuilder<ExercisesCubit, ExerciseState>(
          builder: (_, state) {
            if (state is InitialState) return const SizedBox.shrink();
            if (state is LoadingState) const Center(child: Loading());
            if (state is SuccessState) {
              return ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: state.exercises.length,
                padding: EdgeInsets.symmetric(vertical: Dimens.space16),
                itemBuilder: (_, index) {
                  return index < (state.exercises.length)
                      ? _exerciseItem(state.exercises[index], context)
                      : Padding(
                          padding: EdgeInsets.all(Dimens.space16),
                          child: const Center(
                            child: CupertinoActivityIndicator(),
                          ),
                        );
                },
              );
            }
            if (state is FailureState) {
              return Center(child: Empty(errorMessage: state.message));
            }
            return const Center(child: Empty());
          },
        ),
      ),
    );
  }

  Container _exerciseItem(Exercise exercise, BuildContext context) {
    return Container(
      decoration: BoxDecorations(context).card,
      margin: EdgeInsets.symmetric(
        vertical: Dimens.space8,
        horizontal: Dimens.space16,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimens.space8),
              bottomLeft: Radius.circular(Dimens.space8),
            ),
            child: GifView.asset(
              exercise.imageUrl,
              width: Dimens.profilePicture,
              height: Dimens.profilePicture,
              fit: BoxFit.cover,
              autoPlay: false,
            ),
          ),
          SpacerH(value: Dimens.space16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise.name,
                  style: Theme.of(context).textTheme.titleLargeBold,
                ),
                Text(
                  exercise.muscleGroups.map((mg) => mg.name).join(", "),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Theme.of(context).hintColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

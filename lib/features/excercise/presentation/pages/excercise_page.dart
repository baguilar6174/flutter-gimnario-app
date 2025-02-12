import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gimnario_app/core/core.dart';
import 'package:flutter_gimnario_app/features/features.dart';

class ExcercisePage extends StatelessWidget {
  const ExcercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: CustomAppBar(title: Strings.of(context)!.excercise),
      child: RefreshIndicator(
        onRefresh: () => context.read<ExcerciseCubit>().fetchExercises(),
        child: BlocBuilder<ExcerciseCubit, ExcerciseState>(
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
                itemCount: state.excercises.length,
                padding: EdgeInsets.symmetric(vertical: Dimens.space16),
                itemBuilder: (_, index) {
                  return index < (state.excercises.length)
                      ? Text(state.excercises[index].name)
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

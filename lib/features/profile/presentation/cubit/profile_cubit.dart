import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState(lang: 'en'));

  void updateTheme(ActiveTheme activeTheme) {
    emit(
      ProfileState(activeTheme: activeTheme),
    );
  }

  void updateLanguage(String type) {
    emit(
      ProfileState(lang: type, activeTheme: getActiveTheme()),
    );
  }

  ActiveTheme getActiveTheme() {
    final activeTheme = ActiveTheme.values.singleWhere(
      (element) => element.name == (ActiveTheme.system.name),
    );
    emit(
      ProfileState(
        activeTheme: activeTheme,
        lang: "en",
      ),
    );
    return activeTheme;
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState(lang: 'en'));

  void updateTheme(ActiveTheme activeTheme) {
    emit(state.copyWith(activeTheme: activeTheme));
  }

  void updateLanguage(String type) {
    emit(state.copyWith(lang: type));
  }

  ActiveTheme getActiveTheme() {
    final activeTheme = ActiveTheme.values.singleWhere(
      (element) => element.name == (ActiveTheme.system.name),
    );
    emit(state.copyWith(activeTheme: activeTheme));
    return activeTheme;
  }
}

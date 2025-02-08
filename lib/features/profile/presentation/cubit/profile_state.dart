part of 'profile_cubit.dart';

enum ActiveTheme {
  light(ThemeMode.light),
  dark(ThemeMode.dark),
  system(ThemeMode.system);

  final ThemeMode mode;
  const ActiveTheme(this.mode);
}

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    String? title,
    String? lang,
    @Default(ActiveTheme.light) ActiveTheme activeTheme,
  }) = _ProfileState;
}

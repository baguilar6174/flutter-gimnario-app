part of 'profile_cubit.dart';

enum ActiveTheme {
  light(ThemeMode.light),
  dark(ThemeMode.dark),
  system(ThemeMode.system);

  final ThemeMode mode;
  const ActiveTheme(this.mode);
}

class ProfileState extends Equatable {
  final String? title;
  final String? lang;
  final ActiveTheme activeTheme;

  const ProfileState({
    this.title,
    this.lang,
    this.activeTheme = ActiveTheme.system,
  });

  ProfileState copyWith({
    String? title,
    String? lang,
    ActiveTheme? activeTheme,
  }) {
    return ProfileState(
      title: title ?? this.title,
      lang: lang ?? this.lang,
      activeTheme: activeTheme ?? this.activeTheme,
    );
  }

  @override
  List<Object?> get props => [title, lang, activeTheme];
}

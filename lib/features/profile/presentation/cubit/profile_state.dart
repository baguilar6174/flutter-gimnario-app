part of 'profile_cubit.dart';

enum ActiveTheme {
  light(ThemeMode.light),
  dark(ThemeMode.dark),
  system(ThemeMode.system);

  final ThemeMode mode;
  const ActiveTheme(this.mode);

  // Convert enum to JSON
  String toJson() => name;

  // Convert JSON to enum
  static ActiveTheme fromJson(String json) {
    return ActiveTheme.values.firstWhere(
      (theme) => theme.name == json,
      orElse: () => ActiveTheme.system, // Default value if not found
    );
  }
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

  factory ProfileState.fromJson(Map<String, dynamic> json) {
    return ProfileState(
      title: json['title'] as String?,
      lang: json['lang'] as String?,
      activeTheme: ActiveTheme.fromJson(json['activeTheme']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'lang': lang,
      'activeTheme': activeTheme.toJson(),
    };
  }

  @override
  List<Object?> get props => [title, lang, activeTheme];

  @override
  String toString() =>
      'ProfileState(title: $title, lang: $lang, activeTheme: $activeTheme)';
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gimnario_app/core/core.dart';
import 'package:flutter_gimnario_app/dependencies_injection.dart';
import 'package:flutter_gimnario_app/features/features.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final ActiveTheme selectedTheme = sl<ProfileCubit>().getActiveTheme();

    late final List<ProfileState> listLanguage = [
      ProfileState(title: Constants.get.english, lang: "en"),
      ProfileState(title: Constants.get.spanish, lang: "es"),
    ];

    ProfileState selectedLanguage = listLanguage[0];

    return Parent(
      appBar: CustomAppBar(title: Strings.of(context)!.profile),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dimens.space16),
          child: Column(
            children: [
              DropDown<ActiveTheme>(
                key: const Key("dropdown_theme"),
                hint: Strings.of(context)!.chooseTheme,
                value: selectedTheme,
                prefixIcon: Icon(
                  Icons.light,
                  color: Theme.of(context).extension<AppColors>()!.subtitle,
                ),
                items: ActiveTheme.values
                    .map(
                      (data) => DropdownMenuItem(
                        value: data,
                        child: Text(
                          _getThemeName(data, context),
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context)
                                        .extension<AppColors>()!
                                        .subtitle,
                                  ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  /// Reload theme
                  context
                      .read<ProfileCubit>()
                      .updateTheme(value ?? ActiveTheme.system);
                },
              ),

              /// Language
              DropDown<ProfileState>(
                key: const Key("dropdown_language"),
                hint: Strings.of(context)!.chooseLanguage,
                value: selectedLanguage,
                prefixIcon: Icon(
                  Icons.language_outlined,
                  color: Theme.of(context).extension<AppColors>()!.subtitle,
                ),
                items: listLanguage
                    .map(
                      (data) => DropdownMenuItem(
                        value: data,
                        child: Text(
                          data.title ?? "-",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context)
                                        .extension<AppColors>()!
                                        .subtitle,
                                  ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (ProfileState? value) async {
                  selectedLanguage = value ?? listLanguage[0];

                  /// Reload theme
                  if (!mounted) return;
                  context
                      .read<ProfileCubit>()
                      .updateLanguage(value?.lang ?? "en");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getThemeName(ActiveTheme activeTheme, BuildContext context) {
    if (activeTheme == ActiveTheme.system) {
      return Strings.of(context)!.themeSystem;
    } else if (activeTheme == ActiveTheme.dark) {
      return Strings.of(context)!.themeDark;
    } else {
      return Strings.of(context)!.themeLight;
    }
  }
}

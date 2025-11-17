import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/common/domain/cubits/locale_cubit.dart';
import 'package:movies/common/presentation/cubits/app_info/app_info_cubit.dart';
import 'package:movies/common/presentation/cubits/app_info/app_info_state.dart';
import 'package:movies/common/utils/constants/locale_constants.dart';
import 'package:movies/generated/l10n.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
      child: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              BlocBuilder<LocaleCubit, Locale>(
                builder: (context, locale) {
                  return RadioGroup<String>(
                    onChanged: (value) {
                      if (value != null) {
                        context.read<LocaleCubit>().changeLocale(value);
                      }
                    },
                    groupValue: locale.languageCode,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Center(
                            child: Text(
                              S.of(context).general,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Text(
                            S.of(context).change_language,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(color: Colors.grey[700]),
                          ),
                        ),
                        RadioListTile<String>(
                          value: LocaleConstants.eng,
                          title: Text(S.of(context).english),
                        ),
                        const Divider(),
                        RadioListTile<String>(
                          value: LocaleConstants.cro,
                          title: Text(S.of(context).croatian),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const Spacer(),
              BlocBuilder<AppInfoCubit, AppInfoState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                    loaded: (info) => Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'v${info.version} (${info.buildNumber})',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    error: (failure) => const SizedBox.shrink(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

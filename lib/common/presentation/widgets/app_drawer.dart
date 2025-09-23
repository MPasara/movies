import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/common/domain/cubits/locale_cubit.dart';
import 'package:movies/common/utils/locale_constants.dart';
import 'package:movies/generated/l10n.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
      child: Drawer(
        child: SafeArea(
          child: BlocBuilder<LocaleCubit, Locale>(
            builder: (context, locale) {
              return RadioGroup<String>(
                onChanged: (value) {
                  if (value != null) {
                    context.read<LocaleCubit>().changeLocale(value);
                  }
                },
                groupValue: locale.languageCode,
                child: Column(
                  children: [
                    Text(S.of(context).general),
                    const SizedBox(height: 30),
                    Text(
                      S.of(context).change_language,
                      textAlign: TextAlign.start,
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
        ),
      ),
    );
  }
}

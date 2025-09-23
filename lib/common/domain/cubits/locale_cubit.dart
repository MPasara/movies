import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/common/data/repositories/locale_repository.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit(this._localeRepository) : super(const Locale('en')) {
    loadLocale();
  }

  final LocaleRepository _localeRepository;

  Future<void> loadLocale() async {
    final result = await _localeRepository.fetchLanguage();
    result.fold((failure) {}, (languageCode) {
      if (languageCode != null) {
        emit(Locale(languageCode));
      }
    });
  }

  Future<void> changeLocale(String languageCode) async {
    emit(Locale(languageCode));
    await _localeRepository.setLanguage(languageCode);
  }
}

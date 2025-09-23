import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

sealed class LocaleState extends Equatable {}

final class LocaleInitial extends LocaleState {
  @override
  List<Object> get props => [];
}

final class LocaleLoading extends LocaleState {
  @override
  List<Object> get props => [];
}

final class LocaleLoaded extends LocaleState {
  final Locale locale;

  LocaleLoaded(this.locale);

  @override
  List<Object> get props => [locale];
}

final class LocaleError extends LocaleState {
  final String message;

  LocaleError(this.message);

  @override
  List<Object> get props => [message];
}

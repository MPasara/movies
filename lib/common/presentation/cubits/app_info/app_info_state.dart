import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies/common/domain/entities/app_info.dart';
import 'package:movies/common/domain/failure.dart';

part 'app_info_state.freezed.dart';

@freezed
abstract class AppInfoState with _$AppInfoState {
  const factory AppInfoState.initial() = _Initial;
  const factory AppInfoState.loading() = _Loading;
  const factory AppInfoState.loaded({required AppInfo info}) = _Loaded;
  const factory AppInfoState.error({required Failure failure}) = _Error;
}

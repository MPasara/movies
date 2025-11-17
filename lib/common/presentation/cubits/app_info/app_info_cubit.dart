import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/common/data/repositories/app_info_repository.dart';
import 'package:movies/common/presentation/cubits/app_info/app_info_state.dart';

class AppInfoCubit extends Cubit<AppInfoState> {
  AppInfoCubit(this._repository) : super(const AppInfoState.initial());

  final AppInfoRepository _repository;

  Future<void> loadAppInfo() async {
    final result = await _repository.getAppInfo();
    result.fold(
      (failure) {
        emit(AppInfoState.error(failure: failure));
      },
      (appInfo) {
        emit(AppInfoState.loaded(info: appInfo));
      },
    );
  }
}

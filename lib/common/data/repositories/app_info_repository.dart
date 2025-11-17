import 'package:either_dart/either.dart';
import 'package:movies/common/data/services/package_info_service.dart';
import 'package:movies/common/domain/entities/app_info.dart';
import 'package:movies/common/domain/failure.dart';

abstract class AppInfoRepository {
  Future<Either<Failure, AppInfo>> getAppInfo();
}

class AppInfoRepositoryImpl implements AppInfoRepository {
  AppInfoRepositoryImpl(this._packageInfoService);

  final PackageInfoService _packageInfoService;

  @override
  Future<Either<Failure, AppInfo>> getAppInfo() async {
    try {
      final appInfo = await _packageInfoService.getAppInfo();
      return Right(appInfo);
    } catch (e, st) {
      return Left(Failure(message: e.toString(), stackTrace: st));
    }
  }
}

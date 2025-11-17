import 'package:movies/common/domain/entities/app_info.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoService {
  Future<AppInfo> getAppInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final appInfo = AppInfo.fromPackageInfo(packageInfo);
    return appInfo;
  }
}

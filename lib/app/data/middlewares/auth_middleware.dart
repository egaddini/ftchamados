import 'package:get/get.dart';

import 'package:chamados/routes/app_pages.dart';

import '../services/app_config/service.dart';

class EnsureAuthMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    return Get.find<AppConfigService>().isLogged()
        ? GetNavConfig.fromRoute(AppRoutes.login)
        : await super.redirectDelegate(route);
  }
}

class EnsureNotAuthedMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    return Get.find<AppConfigService>().isLogged()
        ? null
        : super.redirectDelegate(route);
  }
}

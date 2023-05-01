import 'package:chamados/app/pages/home_page.dart';
import 'package:chamados/app/pages/login_page.dart';
import 'package:chamados/app/pages/singup_page.dart';
import 'package:chamados/app/pages/user/user_dashboard_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.login;

  static final routes = [
    GetPage(
      name: _Paths.login,
      page: () => const LoginPage(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomePage(),
      //binding: DashboardBinding(),
    ),
      GetPage(
      name: _Paths.singup,
      page: () => const SingupPage(),
      //binding: DashboardBinding(),
    ),
      GetPage(
      name: _Paths.users,
      page: () => UserDashboardPage(),
      //binding: DashboardBinding(),
    ),

  ];
}
import 'package:chamados/app/features/pages/call/screen/call_dashboard_screen.dart';
import 'package:chamados/app/features/pages/login_singup/login_page.dart';
import 'package:chamados/app/features/pages/login_singup/singup_page.dart';
import 'package:chamados/app/features/pages/menu/screens/home_screen.dart';
import 'package:chamados/app/features/pages/user/screens/user_dashboard_screen.dart';
import 'package:chamados/app/features/pages/user/user_dashboard_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.login;

  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      //binding: DashboardBinding(),
    ),
      GetPage(
      name: Routes.singup,
      page: () => const SingupPage(),
      //binding: DashboardBinding(),
    ),
    ///   GetPage(
    ///   name: Routes.users,
    ///   page: () => UserDashboardPage(),
    ///   //binding: DashboardBinding(),
    /// ),
    GetPage(
      name: Routes.call,
      page: () => const CallDashboardScreen(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.users,
      page: () => const UserDashboardScreen(),
      //binding: DashboardBinding(),
    ),

  ];
}
import 'package:chamados/app/features/pages/call/screen/call_dashboard_screen.dart';
import 'package:chamados/app/features/pages/call_type/screen/call_type_dashboard_screen.dart';
import 'package:chamados/app/features/pages/call_user/screen/call_user_dashboard_screen.dart';
import 'package:chamados/app/features/pages/login/screen/login_screen.dart';
import 'package:chamados/app/features/pages/menu/screens/home_screen.dart';
import 'package:chamados/app/features/pages/singup/screen/singup_screen.dart';
import 'package:chamados/app/features/pages/user/screens/user_list_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.login;

  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      //binding: DashboardBinding(),
    ),
      GetPage(
      name: Routes.singup,
      page: () => const SingupScreen(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.call,
      page: () => const CallDashboardScreen(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.users,
      page: () => const UserListScreen(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.callType,
      page: () => const CallTypeListScreen(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.userCall,
      page: () => const CallUserDashboardScreen(),
      //binding: DashboardBinding(),
    ),
  ];
}
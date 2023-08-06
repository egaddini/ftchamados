import 'package:chamados/app/features/pages/call/screen/call_dashboard_screen.dart';
import 'package:chamados/app/features/pages/call_type/screen/call_type_dashboard_screen.dart';
import 'package:chamados/app/features/pages/call_user/screen/call_user_dashboard_screen.dart';
import 'package:chamados/app/features/pages/login/screen/login_screen.dart';
import 'package:chamados/app/features/pages/menu/home_screen.dart';
import 'package:chamados/app/features/pages/singup/screen/singup_screen.dart';
import 'package:chamados/app/features/pages/system_configs/system_configs_screen.dart';
import 'package:chamados/app/features/pages/user/screens/user_list_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      //binding: DashboardBinding(),
    ),
      GetPage(
      name: AppRoutes.singup,
      page: () => const SingupScreen(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.call,
      page: () => const CallDashboardScreen(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.users,
      page: () => const UserListScreen(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.callType,
      page: () => const CallTypeListScreen(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.userCall,
      page: () => const CallUserDashboardScreen(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.systemSettings,
      page: () => SystemSettingsScreen(),
      //binding: DashboardBinding(),
    ),
  ];
}
import 'package:chamados/app/modules/admin/admin_binding.dart';
import 'package:chamados/app/modules/admin/admin_page.dart';
import 'package:chamados/app/modules/call/dashboard/call_dashboard_bidings.dart';
import 'package:chamados/app/modules/call/dashboard/call_dashboard_screen.dart';
import 'package:chamados/app/modules/chat/chat_binding.dart';
import 'package:chamados/app/modules/chat/chat_page.dart';
import 'package:chamados/app/modules/user/user_binding.dart';
import 'package:chamados/app/modules/user/user_page.dart';
import 'package:get/get.dart';

import 'package:chamados/app/data/middlewares/auth_middleware.dart';
import 'package:chamados/app/modules/drawer/menu_drawer_bindings.dart';
import 'package:chamados/app/modules/singup/singup_bindings.dart';
import 'package:chamados/app/modules/singup/singup_page.dart';

import '../app/modules/call_category/call_category_bidings.dart';
import '../app/modules/call_category/call_category_screen.dart';
import '../app/modules/call_priority/call_priority_bidings.dart';
import '../app/modules/call_priority/call_priority_screen.dart';
import '../app/modules/call_requester/screen/call_requester_dashboard_bidings.dart';
import '../app/modules/call_requester/screen/call_requester_dashboard_screen.dart';
import '../app/modules/call_sector/call_sector_bidings.dart';
import '../app/modules/call_sector/call_sector_screen.dart';
import '../app/modules/call_solver/screen/call_solver_dashboard_bidings.dart';
import '../app/modules/call_solver/screen/call_solver_dashboard_screen.dart';
import '../app/modules/call_solver/statistics/call_solver_statistics_screen.dart';
import '../app/modules/call_solver/statistics/call_solver_statistics_screen_bindings.dart';
import '../app/modules/call_status/call_status_bidings.dart';
import '../app/modules/call_status/call_status_screen.dart';
import '../app/modules/home/home_page.dart';
import '../app/modules/home/home_bindings.dart';
import '../app/modules/login/login_screen.dart';
import '../app/modules/login/login_screen_bindings.dart';

part 'app_routes.dart';

abstract class AppPages {

  static final List<GetPage> pages = [
    GetPage(
        name: AppRoutes.login,
        page: () => const LoginScreen(),
        binding: LoginScreenBindings(),
        participatesInRootNavigator: true,
        preventDuplicates: true,
        middlewares: [
          EnsureNotAuthedMiddleware(),
        ]),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      bindings: [
        HomeBindings(),
        MenuDrawerBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.singup,
      page: () => const SingupPage(),
      binding: SingUpBinding(),
    ),
    GetPage(
      name: AppRoutes.callSolver,
      page: () => const CallSolverDashboardScreen(),
      binding: CallSolverDashboardBindings(),
    ),
    GetPage(
      name: AppRoutes.call,
      page: () => const CallDashboardScreen(),
      binding: CallDashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.users,
      page: () => const UserPage(),
      binding: UserBinding(),
    ),
    GetPage(
      name: AppRoutes.callCategory,
      page: () => const CallCategoryStatusScreen(),
      binding: CallCategoryBindings(),
    ),
    GetPage(
      name: AppRoutes.userCall,
      page: () => const CallUserDashboardScreen(),
      binding: CallRequesterDashboardBindings(),
    ),
    GetPage(
      name: AppRoutes.callStatus,
      page: () => const CallStatusScreen(),
      binding: CallStatusBindings(),
    ),
    GetPage(
      name: AppRoutes.callSector,
      page: () => const CallSectorStatusScreen(),
      binding: CallSectorBindings(),
    ),
    GetPage(
      name: AppRoutes.callPriority,
      page: () => const CallPriorityStatusScreen(),
      binding: CallPriorityBindings(),
    ),
    GetPage(
      name: AppRoutes.callSolverStatistics,
      page: () => const CallSolverStatisticsScreen(),
      binding: CallSolverStatisticsScreenBindings(),
    ),
    GetPage(
      name: AppRoutes.chat,
      page: () => const ChatPage(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: AppRoutes.adminDashboard,
      page: () => AdminPage(),
      binding: AdminBinding(),
    ),
  ];
  
}

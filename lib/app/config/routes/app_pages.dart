import 'package:chamados/app/features/pages/call/screen/call_dashboard_screen.dart';
import 'package:chamados/app/features/pages/call_category/call_category_bidings.dart';
import 'package:chamados/app/features/pages/call_category/call_category_screen.dart';
import 'package:chamados/app/features/pages/call_priority/call_priority_bidings.dart';
import 'package:chamados/app/features/pages/call_priority/call_priority_screen.dart';
import 'package:chamados/app/features/pages/call_requester/screen/call_requester_dashboard_bidings.dart';
import 'package:chamados/app/features/pages/call_sector/call_sector_bidings.dart';
import 'package:chamados/app/features/pages/call_sector/call_sector_screen.dart';
import 'package:chamados/app/features/pages/call_solver/screen/call_solver_dashboard_screen.dart';
import 'package:chamados/app/features/pages/call_solver/statistics/call_solver_statistics_screen.dart';
import 'package:chamados/app/features/pages/call_solver/statistics/call_solver_statistics_screen_bindings.dart';
import 'package:chamados/app/features/pages/call_status/call_status_bidings.dart';
import 'package:chamados/app/features/pages/call_status/call_status_screen.dart';
import 'package:chamados/app/features/pages/call_requester/screen/call_requester_dashboard_screen.dart';
import 'package:chamados/app/features/pages/home/home_screen_bindings.dart';
import 'package:chamados/app/features/pages/login/login_screen.dart';
import 'package:chamados/app/features/pages/login/login_screen_bindings.dart';
import 'package:chamados/app/features/pages/home/home_screen.dart';
import 'package:chamados/app/features/pages/singup/screen/singup_screen.dart';
import 'package:chamados/app/features/pages/user/screens/user_screen.dart';
import 'package:chamados/app/features/pages/user/screens/user_screen_bindings.dart';
import 'package:get/get.dart';

import '../../features/pages/call_solver/screen/call_solver_dashboard_bidings.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: LoginScreenBindings(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: HomeScreenBindings(),
    ),
      GetPage(
      name: AppRoutes.singup,
      page: () => const SingupScreen(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.call,
      page: () => const CallSolverDashboardScreen(),
      binding: CallSolverDashboardBindings(),
    ),
    GetPage(
      name: AppRoutes.users,
      page: () => const UserScreen(),
      binding: UserScreenBindings(),
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
    // GetPage(
    //   name: AppRoutes.callGraphs,
    //   page: () => DigimonPage(),
    //   binding: CallPriorityBindings(),
    // ),    
    GetPage(
      name: AppRoutes.callSolverStatistics,
      page: () => const CallSolverStatisticsScreen(),
      binding: CallSolverStatisticsScreenBindings(),
    ),    
  ];
}
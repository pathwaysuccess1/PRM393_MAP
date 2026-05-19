import 'package:go_router/go_router.dart';
import '../../features/shell/presentation/app_shell.dart';
import '../../features/shell/presentation/seeding_screen.dart';

final goRouter = GoRouter(
  initialLocation: '/seed',
  routes: [
    GoRoute(
      path: '/seed',
      builder: (context, state) => const SeedingScreen(),
    ),
    GoRoute(
      path: '/map',
      builder: (context, state) => const AppShell(),
    ),
  ],
);

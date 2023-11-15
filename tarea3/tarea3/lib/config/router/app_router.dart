import 'package:go_router/go_router.dart';
import 'package:tarea3/presentation/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (contest,state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/add-professor',
      builder: (contest,state) => const ProfessorAddModifyScreen(),
    )
  ]
);
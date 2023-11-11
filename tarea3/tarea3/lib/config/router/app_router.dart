import 'package:go_router/go_router.dart';
import 'package:tarea3/presentation/widgets/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (contest,state) => const HomeScreen(),
    )
  ]
);
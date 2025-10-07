import '../feautures/screens.dart';
import 'list_book_router.dart';
import '../feautures/test_page/test_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    /// Основной, корневой маршрут
    AutoRoute(
      page: RootRoute.page,
      initial: true,
      children: [
        /// Вложенные маршруты
        ListBooksRoutes.routes,
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: Test1Route.page),
      ],
    ),
  ];
}

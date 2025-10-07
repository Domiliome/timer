import 'package:auto_route/auto_route.dart' hide TestRoute;
import 'package:flutter/material.dart';
import '../routing/app_router.dart';

@RoutePage()
class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [ListBooksWrapperRoute(), ProfileRoute(), Test1Route()],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(label: 'Все книги', icon: Icon(Icons.book)),
            BottomNavigationBarItem(
              label: 'Профиль',
              icon: Icon(Icons.verified_user),
            ),
            BottomNavigationBarItem(label: 'Test', icon: Icon(Icons.wallet)),
          ],
        );
      },
    );
  }
}

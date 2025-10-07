<a name="#меню"></a> 
# Тестовый проект
##  Меню
- [Стек](#стек)
- [Структура проекта](#структура)
- [UI](#ui)
- [Навигация](#навигация)
- [Управление состоянием](#bloc)

<a name="#cтек"></a>

##  [[<](#меню)] Стек 
1. Ядро: [**flutter**](https://docs.flutter.dev/)
2. Управление состоянием: [**bloc**](https://bloclibrary.dev/ru/)
3. Навигация: [**auto_route**](https://pub.dev/packages/auto_route)


<a name="#структура"></a>
##  [[<](#меню)] Структура


```
lib 
    doc  
        main.md

    feautures  
        screens
        root_screen.dart
        screens.dart

    routing
        app_router.dart
        app_router.gr.dart
        list_book_router.dart

    ui
        theme.dart
        ui.package.dart

    index.dart  
    main.dart  
 ```


<a name="#ui"></a> 
## [[<](#меню)] UI 
### Тема
**Расположение**: [/lib/ui/theme.dart](/lib/ui/theme.dart)

**Cодержание**: 
- ```ThemeData lightTheme``` - экземпляр светлой темы.
- ```ThemeData darkTheme``` - экземпляр тёмной темы.

<a name="#навигация"></a>

## [[<](#меню)] Навигация 

Навигация в приложении реализована с помощью auto_route обёртки для MaterialApp.
### Добавление новой страницы в главное меню
1. В папке /lib/feautures/name создаём ```name_screen.dart```
2. Шаблон кода для ```name_screen.dart```:
```
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NameScreen extends StatelessWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Name')));
  }
}
```
>Не называйте класс "TestScreen", сгенериться класс "TestRoute" а такой есть в auto_route, поэтому возникнет конфликт импортов.
3. Добавляем экспорт страницы в ```/feautures/screens.dart```  
4. Запускаем команду для кодогенерациии ```dart run build_runner build --delete-conflicting-outputs```  
5. В ```/routing/app_router.dart``` добавляем сгенерированный роут в ```children = []``` по шаблону ```AutoRoute(page: NameRoute.page)```  
6. В root_screen добавляем route и BottomNavigationBarItem для отображения в UI.  
>При добавлении учесть что в BottomNavigationBar если items больше 3 элементов, нужно добавить   ```type:BottomNavigationBarType.fixed``` (костыль виджета)

### Добавление вложенной навигации для элементов страницы
1.В папке /lib/feautures/main_wrapper_screen создаём ```name_screen.dart``` (main_name это страница в которой помещаются вложенные страницы)
2.Тут же создаём main_name_wrapper.dart по шаблону:
```
@RoutePage()
class NameWrapperScreen extends StatelessWidget
    implements AutoRouteWrapper {
  const MainNameWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}
```
3.Запускаем команду для кодогенерациии ```dart run build_runner build --delete-conflicting-outputs```  
4. в папке ```/routing``` создаём файл навигации для вложенных страниц ```name_router.dart``` по шаблону:
```
import 'package:auto_route/auto_route.dart';
import 'app_router.dart';

abstract class ListBooksRoutes {
  static final routes = AutoRoute(
    page: MainNameWrapperRoute.page,
    children: [
      AutoRoute(page: MainNameRoute.page, initial: true),
      AutoRoute(page: NameRoute.page),
    ],
  );
}
```  
5. В ```/routing/app_router.dart``` добавляем сгенерированный роут в ```children = []``` по шаблону ```MainNameRoutes.routes```  

<a name="#bloc"></a>

## [[<](#меню)] Bloc

```bloc/bloc_observer.dart``` - содержит класс наблюдатель bloc, который следит за обращениям к bloc  
```bloc/counter.bloc``` - содержит классы для изменения состояния  
```main.dart``` - класс MyApp обёрнут в мультипровайдером ```MultiBlocProvider```, который содержит провайдеры для изменения состояний.  
## Добавление Bloc
1. В папке ```/bloc``` создаём ```name_bloc``` с шаблоном 
```
import "package:flutter_bloc/flutter_bloc.dart";

sealed class NameEvent {}

final class NamePressed extends NameEvent {
  final type name;
  NamePressed(this.name);
}

class NameBloc extends Bloc<NameEvent, int> {
  NameBloc() : super() {
    on<NamePressed>((event, emit) {
      // function
      emit(state);
    });
  }
}
```  
2. В ```main.dart``` добавляем Provider для NameBloc.  
3. В ```name_screen``` обращаемся к блоку ```context.read<NameBloc>().add(NamePressed())```


import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../routing/app_router.dart';
import 'watch_card.dart';

final List<Map<String, dynamic>> items = [
  {
    'title': 'Test',
    'time': const TimeOfDay(hour: 3500, minute: 13),
    'isActive': false,
  },
];

const mockListBooks = [
  'Книга 1',
  'Книга 2',
  'Книга 3',
  'Книга 4',
  'Книга 5',
  'Книга 6',
  'Книга 7',
];

@RoutePage()
class ListBooksScreen extends StatelessWidget {
  const ListBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Список карточек')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return CustomCard(
            title: item['title'],
            time: item['time'],
            isActive: item['isActive'],
            onPlayPressed: () {
              print('Play pressed for ${item['title']}');
            },
            onStopPressed: () {
              print('Stop pressed for ${item['title']}');
            },
            onTap: () {
              context.router.push(const AboutBookRoute());
              // Навигация к деталям, редактирование и т.д.
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Выбрано: ${item['title']}')),
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../routing/app_router.dart';

@RoutePage()
class AboutBookScreen extends StatelessWidget {
  const AboutBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name'),
        actions: [
          IconButton(
            onPressed: () {
              context.router.push(const SettingsBookRoute());
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}

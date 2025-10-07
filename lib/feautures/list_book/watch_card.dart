import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final TimeOfDay time;
  final bool isActive;
  final VoidCallback onPlayPressed;
  final VoidCallback onStopPressed;
  final VoidCallback onTap;

  const CustomCard({
    Key? key,
    required this.title,
    required this.time,
    required this.isActive,
    required this.onPlayPressed,
    required this.onStopPressed,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Левая часть - кнопки и название
              Row(
                children: [
                  // Кнопка включить
                  IconButton(
                    onPressed: onPlayPressed,
                    icon: Icon(
                      Icons.play_arrow,
                      color:
                          isActive
                              ? const Color.fromARGB(255, 48, 48, 48)
                              : Colors.white,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor:
                          isActive
                              ? Colors.grey[300]
                              : const Color.fromARGB(160, 31, 31, 31),
                      shape: const CircleBorder(),
                    ),
                  ),

                  const SizedBox(width: 1),

                  // Кнопка стоп
                  IconButton(
                    onPressed: onStopPressed,
                    icon: const Icon(Icons.stop, color: Colors.white),
                    style: IconButton.styleFrom(
                      backgroundColor: const Color.fromARGB(160, 31, 31, 31),
                      shape: const CircleBorder(),
                    ),
                  ),

                  const SizedBox(width: 16),

                  // Название
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),

              // Правая часть - время
              Column(
                children: [
                  Text(
                    '${time.hour} ч всего',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 252, 252, 252),
                    ),
                  ),
                  Text(
                    'Вчера',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 252, 252, 252),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

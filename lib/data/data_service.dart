import 'todo.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DataService {
  // Получаем ссылку на наш бокс
  final Box<Todo> _todoBox = Hive.box<Todo>('todos');

  // Получить все задачи
  List<Todo> getTodos() {
    // Возвращаем все значения из бокса.
    // Hive возвращает значения в порядке их добавления (не отсортированные по ключам).
    return _todoBox.values.toList();
  }

  // Добавить новую задачу
  Future<void> addTodo(Todo newTodo) async {
    await _todoBox.put(newTodo.id, newTodo);
  }

  // Обновить задачу
  Future<void> updateTodo(Todo updatedTodo) async {
    await _todoBox.put(updatedTodo.id, updatedTodo);
  }

  // Удалить задачу
  Future<void> deleteTodo(String id) async {
    await _todoBox.delete(id);
  }

  // Пометить задачу как выполненную/невыполненную
  Future<void> toggleTodoStatus(String id) async {
    Todo? todo = _todoBox.get(id);
    if (todo != null) {
      todo.isCompleted = !todo.isCompleted;
      await todo.save(); // Метод save() доступен для HiveObject
      // Или альтернативно: await _todoBox.put(id, todo);
    }
  }
}

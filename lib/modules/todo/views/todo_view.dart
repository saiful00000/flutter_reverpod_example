import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/modules/todo/models/todo.dart';
import 'package:riverpod_example/modules/todo/providers/todo_notifiers.dart';

final todoProvider = StateNotifierProvider<TodoNotifiers, List<Todo>>((ref) {
  return TodoNotifiers();
});

class TodoView extends ConsumerWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    List<Todo> todoList = ref.watch(todoProvider);

    return Scaffold(
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                todoList[index].name,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          if(todoList.length == 5){
            ref.read(todoProvider.notifier).clearTodoList();
          }else{
            ref.read(todoProvider.notifier)
                .addTodo(Todo(name: '${todoList.length + 1}'));
          }
        },
      ),
    );
  }
}

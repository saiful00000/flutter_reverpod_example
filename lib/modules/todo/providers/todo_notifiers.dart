import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/modules/todo/models/todo.dart';

class TodoNotifiers extends StateNotifier<List<Todo>>{
  TodoNotifiers(): super([]);

  void addTodo(Todo todo){
    state = [...state, todo];
  }

  void removeTodo(String todoName){
    state = [
      for(final todo in state)
        if(todoName != todo.name)
          todo
    ];
  }

  void clearTodoList () => state = [];
}
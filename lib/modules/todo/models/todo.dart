
import 'package:flutter/foundation.dart';

@immutable
class Todo{
  final String name;

  const Todo({required this.name});


  Todo copyWith({String? name}){
    return Todo(name: name ?? this.name);
  }
}
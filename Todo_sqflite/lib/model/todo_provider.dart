import 'package:flutter/material.dart';
import 'package:sqflite_todo_list/model/db_helper.dart';
import 'package:sqflite_todo_list/model/todo_model.dart';

class TodoProvider extends ChangeNotifier{
  List<TodoModel> _todos = [];
  List<TodoModel> get todos => _todos;

  String _task = '';
  String get task => _task;

  String searchQuery = '';

  void setTaskText(value){
    _task = value;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    searchQuery = query;
    notifyListeners();
  }

  List<TodoModel> get filteredTodos {
    if (searchQuery.isEmpty) {
      return todos;
    } else {
      return todos
          .where((todo) =>
          todo.task.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    }
  }

  Future<void> getUsers() async{
    _todos = await DbHelper.instance.getAll();
    notifyListeners();
  }
  Future<void> insert(TodoModel todoModel) async{
    await DbHelper.instance.insert(todoModel);
    getUsers();
  }

  Future<void> update(TodoModel todoModel) async{
    await DbHelper.instance.update(todoModel);
    getUsers();
  }

  Future<void> delete(int id) async{
    await DbHelper.instance.delete(id);
    getUsers();
  }
}
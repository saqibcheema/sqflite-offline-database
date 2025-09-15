import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_todo_list/model/todo_model.dart';

import '../model/todo_provider.dart';

class ListviewWidget extends StatelessWidget {
  const ListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer(
        builder: (context, value, child) {
          final provider = Provider.of<TodoProvider>(context);
          final todos = provider.filteredTodos;
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 7),
              child: Card(
                elevation: 4,
                child: Container(
                  height: 80,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<TodoProvider>().update(
                            TodoModel(
                              task: todos[index].task,
                              isDone: todos[index].isDone == true
                                  ? false
                                  : true,
                              id: todos[index].id,
                            ),
                          );
                        },
                        icon: todos[index].isDone
                            ? Icon(Icons.check_box, color: Colors.green)
                            : Icon(
                                Icons.check_box_outline_blank,
                                color: Colors.grey,
                              ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 16, right: 10),
                          child: Text(
                            todos[index].task,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              decoration: todos[index].isDone ? TextDecoration.lineThrough : null,
                              decorationThickness: 2.0
                            ),
                            maxLines: 2,
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.white),
                          onPressed: () {
                            context.read<TodoProvider>().delete(
                              provider.todos[index].id!,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

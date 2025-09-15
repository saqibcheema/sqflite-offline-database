import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/todo_model.dart';
import '../model/todo_provider.dart';

class AddTaskButton extends StatelessWidget {
  final TextEditingController textController;
  const AddTaskButton({super.key,required this.textController});

  @override
  Widget build(BuildContext context,) {
    final provider = Provider.of<TodoProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          if(textController.text.trim().isNotEmpty){
            provider.insert(TodoModel(task: provider.task, isDone: false));
          }
          textController.clear();
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(16),
        ),
          child: Icon(Icons.add,color: Colors.white,),
        ),
      ),
    );
  }
}

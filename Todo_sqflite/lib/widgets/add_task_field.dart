import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/todo_provider.dart';

class AddTaskField extends StatefulWidget {
  final TextEditingController textController;
  const AddTaskField({super.key,required this.textController});

  @override
  State<AddTaskField> createState() => _AddTaskFieldState();
}

class _AddTaskFieldState extends State<AddTaskField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      decoration: InputDecoration(
        hint: Text('Add Task'),
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        )
      ),
      onChanged: (value){
        context.read<TodoProvider>().setTaskText(value);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/todo_provider.dart';

class TextFormFieldWidget extends StatefulWidget {
  TextEditingController searchController = TextEditingController();
  TextFormFieldWidget({super.key, required this.searchController});

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.searchController,
      decoration: const InputDecoration(
          hint: Text('Search...'),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(16))
          ),
          prefixIcon: Icon(Icons.search),
      ),
      onChanged: (value){
        context.read<TodoProvider>().setSearchQuery(value);
        context.read<TodoProvider>().filteredTodos;
      }
    );
  }
}

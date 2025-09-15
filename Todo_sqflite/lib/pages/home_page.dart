import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_todo_list/widgets/add_task_button.dart';
import 'package:sqflite_todo_list/widgets/add_task_field.dart';
import '../model/todo_model.dart';
import '../model/todo_provider.dart';
import '../widgets/listview_widget.dart';
import '../widgets/textformfield_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController taskController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    context.read<TodoProvider>().getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            buildTopRow(),
            SizedBox(height: 40,),
            TextFormFieldWidget(searchController: searchController,),
            SizedBox(height: 40,),
            Text('All Todos',style: TextStyle(fontSize: 40,),),
            const ListviewWidget(),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: AddTaskField(textController: taskController,),
                    ),
                    AddTaskButton(textController: taskController,)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget buildTopRow() =>  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Icon(Icons.menu),
      CircleAvatar(
        backgroundImage: const AssetImage('assets/profile.jpg'),
      )
    ]
);
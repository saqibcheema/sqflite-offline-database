import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_todo_list/pages/home_page.dart';

import 'model/todo_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.shade50),
        ),
        home: const HomePage(),
      ),
    );
  }
}
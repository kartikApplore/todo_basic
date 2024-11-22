import 'package:basic_todo_flutter/screens/add_todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/todo_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
        centerTitle: false,
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_task),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => const AddTodoScreen()));
          }),
      body: Column(
        children: [
          Expanded(
            child: Consumer<TodoProvider>(
              builder: (context, provider, child) {
                return provider.todos.isEmpty
                    ? const Center(
                        child: Text('No Todo added yet'),
                      )
                    : ListView.builder(
                        itemCount: provider.todos.length,
                        itemBuilder: (context, index) {
                          final task = provider.todos[index];
                          return ListTile(
                            leading: Checkbox(
                              value: task.isCompleted,
                              onChanged: (value) {
                                provider.updateCompletionStatus(index);
                              },
                            ),
                            title: Text(
                              task.title,
                              style: TextStyle(
                                decoration: task.isCompleted
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}

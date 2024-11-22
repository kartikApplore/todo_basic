import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/todo_provider.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  final TextEditingController _todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create new Todo'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _todoController,
                decoration: const InputDecoration(
                  labelText: 'Enter todo name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                if (_todoController.text.isNotEmpty) {
                  todoProvider.addTodo(_todoController.text);
                  _todoController.clear();
                  // ScaffoldMessenger.of(context).showMaterialBanner(
                  //     MaterialBanner(
                  //         content: const Text('Todo added successfully'),
                  //         actions: [
                  //       TextButton(
                  //         onPressed: () {
                  //           ScaffoldMessenger.of(context)
                  //               .hideCurrentMaterialBanner();
                  //         },
                  //         child: const Text('Dismiss'),
                  //       ),
                  //     ]));
                  Navigator.pop(context);
                }
              },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}

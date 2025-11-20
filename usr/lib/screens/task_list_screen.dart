import 'package:flutter/material.dart';
import '../models/task.dart';
import 'task_details_screen.dart';

class TaskListScreen extends StatelessWidget {
  final List<Task> tasks = [
    Task(title: 'Write a blog post', description: 'Write a 500-word blog post about Flutter.', pay: 50.0),
    Task(title: 'Design a logo', description: 'Create a logo for a new startup.', pay: 100.0),
    Task(title: 'Translate a document', description: 'Translate a 2-page document from English to Spanish.', pay: 75.0),
    Task(title: 'Test a mobile app', description: 'Test a new mobile app and report bugs.', pay: 60.0),
  ];

  TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text('\$${task.pay.toStringAsFixed(2)}'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskDetailsScreen(task: task),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

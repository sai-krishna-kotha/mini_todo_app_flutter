import 'package:flutter/material.dart';
import '../models/todo.dart';

class TaskDetailPage extends StatelessWidget {
  final Todo todo;
  const TaskDetailPage({
    super.key,
    required this.todo,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task details page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              todo.text,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              todo.completed ? "Status: Completed" : "Status: Pending",
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../models/todo.dart';


class TodoItem extends StatelessWidget {
  final Todo todo;
  final VoidCallback onToggle;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback onTap;

  const TodoItem({
    super.key,
    required this.todo,
    required this.onToggle,
    required this.onDelete,
    required this.onEdit,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todo.completed,
        onChanged: (_) {
          onToggle();
        },
      ),
      title: Text(
        todo.text,
        style: TextStyle(
          decoration: todo.completed
              ? TextDecoration.lineThrough
              : TextDecoration.none,
          decorationThickness: 2.5,
          decorationColor: todo.completed ? Colors.red : Colors.black,
          color: todo.completed ? Colors.grey : Colors.black,
        ),
      ),
      subtitle: Text(
        todo.completed ? "Completed" : "Pending",
      ),
      onTap: onTap,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete),
          ),
          IconButton(
            onPressed: onEdit,
            icon: const Icon(Icons.edit),
          ),
        ],
      )

    );
  }
}
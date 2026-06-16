import 'package:flutter/material.dart';
import 'widgets/todo_item.dart';
import 'models/todo.dart';


void main() {
  runApp(
    MaterialApp(
      home: TodoHomePage(),
    )
  );
}

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {

  final TextEditingController controller = TextEditingController();
  List<Todo> todos = [];
  int? editingIndex;

  void addTodo() {
    final text = controller.text.trim();
    if (text.isEmpty){
      return;
    }
    setState(() {
        todos.add(Todo(text: text, completed: false));
        controller.clear();
      // print(todos);
    });
  }

  void deleteTodo(int index) {
    setState(() {
      if (editingIndex == index){
        editingIndex = null;
        controller.clear();
      }
      else if (editingIndex != null && index < editingIndex!) {
        editingIndex = editingIndex! - 1;
      }
      todos.removeAt(index);
    });
  }

  void toggleTodo(int index) {
    setState(() {
      todos[index].completed = !todos[index].completed;
      // print(todos);
    });
  }

  void editTodo(int index){
    setState(() {
      if (index < 0) {
        editingIndex = null;
        controller.clear();
        return;
      }
      editingIndex = index;
      controller.text = todos[index].text;
      controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length));
    });
  }

  void updateTodo() {
    final text = controller.text.trim();
    if (text.isEmpty || editingIndex == null) {
      return;
    }
    setState(() {
      todos[editingIndex!].text = text;
      editingIndex = null;
      controller.clear();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar:
          AppBar(
            title: Text("Mini Todo app"),
          ),
        body:
          SizedBox(
            width: double.infinity,
            child: MainHomeScreen(
              controller: controller,
              onAdd: addTodo,
              todos: todos,
              onDelete: deleteTodo,
              onToggleTodo: toggleTodo,
              onEdit: editTodo,
              onUpdate: updateTodo,
              editingIndex: editingIndex,
            ),
          ),
      );
  }
}

class MainHomeScreen extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onAdd;
  final List<Todo> todos;
  final void Function(int) onDelete;
  final void Function(int) onToggleTodo;
  final void Function(int) onEdit;
  final VoidCallback onUpdate;
  final int? editingIndex;

  const MainHomeScreen({
    super.key,
    required this.controller,
    required this.onAdd,
    required this.todos,
    required this.onDelete,
    required this.onEdit,
    required this.onUpdate,
    required this.onToggleTodo,
    required this.editingIndex,
  });

  @override
  Widget build(BuildContext context) {
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // TodoDisplay(),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter a task"
              ),
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: editingIndex == null ? onAdd : onUpdate,
                child: Text(editingIndex == null ? "Add Task" : "Update Task"),
              ),
              if (editingIndex != null) ...[
                SizedBox(width: 10),
                TextButton(
                  onPressed: () => onEdit(-1), // Conventionally used to clear selection
                  child: Text("Cancel"),
                ),
              ],
            ],
          ),
          SizedBox(height: 20,),
          Text(
            "Tasks",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: todos.isEmpty
              ? Center(
                  child: Text("No tasks yet. Add one above!"),
              )
              :  ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return TodoItem(
                      todo: todos[index],
                      onToggle: () => onToggleTodo(index),
                      onDelete: () => onDelete(index),
                      onEdit: () => onEdit(index),
                    );
                  },
              ),
          ),
        ],
      );
  }
}

class TodoDisplay extends StatelessWidget {
  const TodoDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Text(
        "Todo",
        style:
        TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      );
  }
}


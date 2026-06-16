class Todo {
  String text;
  bool completed;
  Todo({
    required this.text,
    required this.completed
  });
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'completed': completed,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      text: json['text'] as String,
      completed: json['completed'] as bool,
    );
  }
}
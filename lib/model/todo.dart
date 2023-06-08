
 enum Priority {urgent, normal, low}

class ToDo{
  final String text;
  final Priority priority;

  ToDo({required this.text, required this.priority});
}
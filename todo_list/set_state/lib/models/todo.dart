class Todo {
  final int id;
  final String text;
  final bool isDone;

  Todo({
    required this.id,
    required this.text,
    this.isDone = false,
  });
}

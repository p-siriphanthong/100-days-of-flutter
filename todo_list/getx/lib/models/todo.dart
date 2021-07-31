class Todo {
  final int id;
  String text;
  bool isDone;

  Todo({
    required this.id,
    required this.text,
    this.isDone = false,
  });
}

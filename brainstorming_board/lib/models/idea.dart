class Idea {
  final int id;
  final String text;

  Idea({
    required this.id,
    required this.text,
  });

  factory Idea.fromJson(Map<String, dynamic> json) {
    return Idea(
      id: json['id'],
      text: json['text'],
    );
  }
}

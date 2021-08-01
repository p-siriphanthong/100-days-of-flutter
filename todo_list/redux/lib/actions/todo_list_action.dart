class CreateItem {
  final String text;

  const CreateItem({required this.text});
}

class UpdateItem {
  final int id;
  final String? text;
  final bool? isDone;

  const UpdateItem({required this.id, this.text, this.isDone});
}

class DeleteItem {
  final int id;

  const DeleteItem({required this.id});
}

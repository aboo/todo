class TodoItem{
  String title;
  String description;
  List<String> tags;
  String status;

  TodoItem(
      {required this.title,
        required this.description,
        required this.tags,
        required this.status});
}
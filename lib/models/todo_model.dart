class TodoModel {
  final String title;
  final String detail;
  final List<String> tags;
  final bool isDone;

  TodoModel(
      {this.title, this.detail, this.tags = const [], this.isDone = false});
}

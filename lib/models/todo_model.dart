class TodoModel {
  int? id;
  String? title;
  String? description;
  bool isDone;

  TodoModel({this.id, this.title, this.description, this.isDone = false});
}

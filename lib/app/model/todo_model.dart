import 'package:equatable/equatable.dart';

class TodoModel extends Equatable{
  late String id;
  late String title;
  late String description;
  late String tag;
  late int isComplete;

  TodoModel( this.id,this.title, this.description,
      this.tag, this.isComplete);

  @override
  List<Object?> get props =>  [id, title, description, tag, isComplete];


  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    tag = json['tag'];
    isComplete = json['isComplete'];
  }


  Map<String, Object?> toJson() {
    final Map<String, Object?> data = new Map<String, Object?>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['tag'] = this.tag;
    data['isComplete'] = this.isComplete ;
    return data;
  }
}
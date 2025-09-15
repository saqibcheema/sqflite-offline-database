class TodoModel{
  int? id;
  final String task;
  final bool isDone;
  TodoModel({this.id,required this.task, required this.isDone});

  Map<String, dynamic> toMap() {
    return {'task': task, 'isDone': isDone ? 1 : 0, 'id' : id};
  }

  static TodoModel fromMap(Map<String, dynamic> map) {
    return TodoModel(task: map['task'], isDone: map['isDone'] == 1 ? true : false,id: map['id']);
  }

}
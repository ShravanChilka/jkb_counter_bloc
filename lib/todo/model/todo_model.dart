class TodoModel {
  const TodoModel({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.isCompleted,
  });

  final int id;
  final String title;
  final DateTime createdAt;
  final bool isCompleted;

  factory TodoModel.fromMap(Map<String, Object?> map) {
    return TodoModel(
      id: map['id'] as int,
      title: map['title'] as String,
      createdAt: DateTime.fromMicrosecondsSinceEpoch(
        map['createdAt'] as int,
      ),
      isCompleted: (map['createdAt'] as int) == 1,
    );
  }

  Map<String, dynamic> toCreateTodoMap() {
    return {
      'title': title,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }
}

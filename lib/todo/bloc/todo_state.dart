import '../model/todo_model.dart';

class TodoState {
  final List<TodoModel> todos;
  final bool isLoading;
  final bool isCreated;

  factory TodoState.initial() {
    return const TodoState(
      todos: [],
      isLoading: false,
      isCreated: false,
    );
  }

  const TodoState({
    required this.todos,
    required this.isLoading,
    required this.isCreated,
  });

  TodoState copyWith({
    List<TodoModel>? todos,
    bool? isLoading,
    bool? isCreated,
  }) {
    return TodoState(
      todos: todos ?? this.todos,
      isLoading: isLoading ?? this.isLoading,
      isCreated: isCreated ?? this.isCreated,
    );
  }
}

abstract class TodoEvent {
  const TodoEvent();
}

class TodoEventCreateDatabase extends TodoEvent {}

class TodoEventFetchAll extends TodoEvent {}

class TodoEventCreate extends TodoEvent {
  const TodoEventCreate({
    required this.title,
  });

  final String title;
}

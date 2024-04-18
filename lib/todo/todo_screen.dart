import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_bloc/todo/bloc/todo_bloc.dart';
import 'package:jkb_bloc/todo/bloc/todo_event.dart';
import 'package:jkb_bloc/todo/bloc/todo_state.dart';
import 'package:jkb_bloc/todo/create_todo_screen.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(TodoEventCreateDatabase());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Create'),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreateTodoScreen(),
            ),
          );
        },
        icon: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Todo Screen'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.pending_actions),
                title: Text(state.todos[index].title),
                subtitle: Text(DateTime.now().toString()),
                trailing: IconButton.filledTonal(
                  onPressed: () {},
                  icon: const Icon(Icons.check),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

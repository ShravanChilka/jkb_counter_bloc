import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_bloc/todo/bloc/todo_bloc.dart';
import 'package:jkb_bloc/todo/bloc/todo_event.dart';
import 'package:jkb_bloc/todo/bloc/todo_state.dart';

class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({super.key});

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  final titleController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Todo'),
        actions: [
          FilledButton.icon(
            onPressed: () {
              if (formKey.currentState?.validate() == true) {
                context.read<TodoBloc>().add(
                      TodoEventCreate(
                        title: titleController.text,
                      ),
                    );
              }
            },
            icon: const Icon(Icons.save),
            label: const Text('Create'),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: BlocListener<TodoBloc, TodoState>(
        listener: (context, state) {
          if (state.isCreated) {
            Navigator.of(context).pop();
          }
        },
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  validator: (text) {
                    if (text == null) return 'Please enter title';
                    if (text.isEmpty) return 'Please enter title';
                    if (text.length < 4) {
                      return 'Title must be atleast 5 characters';
                    }
                    return null;
                  },
                  // autovalidateMode: AutovalidateMode.always,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    hintText: 'Enter title',
                    labelText: 'Title',
                    alignLabelWithHint: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

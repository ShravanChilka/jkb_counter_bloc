import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_bloc/todo/model/todo_model.dart';
import 'package:sqflite/sqflite.dart';

import 'todo_event.dart';
import 'todo_state.dart';

const tableName = 'Todos';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  late final Database database;

  TodoBloc() : super(TodoState.initial()) {
    on<TodoEventCreateDatabase>((event, emit) async {
      try {
        emit(state.copyWith(isLoading: true));
        final databasePath = getDatabasesPath();
        final path = '$databasePath/todo_database.db';
        database = await openDatabase(
          path,
          version: 1,
          onCreate: (db, version) async {
            await db.execute(
              'CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, createdAt INTEGER, isCompleted INTEGER)',
            );
          },
        );
        add(TodoEventFetchAll());
        emit(state.copyWith(isLoading: false));
      } catch (e) {
        log(e.toString());
      }
    });

    on<TodoEventFetchAll>((event, emit) async {
      final response = await database.query(
        tableName,
        columns: ['id', 'title', 'createdAt', 'isCompleted'],
      );
      final todos = response
          .map(
            (map) => TodoModel.fromMap(map),
          )
          .toList();
      emit(state.copyWith(todos: todos));
    });

    on<TodoEventCreate>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final todo = TodoModel(
        id: 0,
        title: event.title,
        createdAt: DateTime.now(),
        isCompleted: false,
      );
      final isCreated = await database.insert(
        tableName,
        todo.toCreateTodoMap(),
      );
      add(TodoEventFetchAll());
      emit(
        state.copyWith(
          isLoading: false,
          isCreated: isCreated != 0,
        ),
      );
    });
  }
}

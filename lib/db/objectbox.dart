import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import '../objectbox.g.dart'; // This will be generated
import '../models/task.dart';

class ObjectBox {
  /// The Store of this app.
  late final Store _store;
  
  /// A Box storing all Task objects.
  late final Box<Task> taskBox;

  ObjectBox._create(this._store) {
    taskBox = Box<Task>(_store);
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore(directory: p.join(docsDir.path, "task-db"));
    return ObjectBox._create(store);
  }
  
  List<Task> getAllTasks() {
    return taskBox.getAll();
  }
  
  int addTask(Task task) {
    return taskBox.put(task);
  }
  
  bool removeTask(int id) {
    return taskBox.remove(id);
  }
  
  void updateTask(Task task) {
    taskBox.put(task);
  }
}
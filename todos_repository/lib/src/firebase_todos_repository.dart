import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todos_repository/src/entities/entities.dart';
import 'package:todos_repository/src/models/models.dart';
import 'package:todos_repository/src/todos_repository.dart';

class FirebaseTodosRepository implements TodosRepository {
  final todoCollection = Firestore.instance.collection('todos');

  @override
  Future<void> addNewTodo(Todo todo) {
    return todoCollection.add(todo.toEntity().toDocument());
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    return todoCollection.document(todo.id).delete();
  }

  @override
  Stream<List<Todo>> todos() {
    return todoCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((e) => Todo.fromEntity(TodoEntity.fromSnapShot(e)))
          .toList();
    });
  }

  @override
  Future<void> updateTodo(Todo todo) {
    return todoCollection
        .document(todo.id)
        .updateData(todo.toEntity().toDocument());
  }
}

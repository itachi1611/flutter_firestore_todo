import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final bool complete;
  final String id;
  final String note;
  final String task;

  const TodoEntity(this.task, this.id, this.note, this.complete);

  Map<String, Object> toJson() {
    return {
      "complete": complete,
      "id": id,
      "note": note,
      "task": task
    };
  }

  @override
  List<Object> get props => [complete, id, note, task];

  @override
  String toString() => 'TodoEntity { complete: $complete, task: $task, note: $note, id: $id }';

  static TodoEntity fromJson(Map<String, Object> json) {
    return TodoEntity(
      json['task'] as String,
      json['id'] as String,
      json['note'] as String,
      json['complete'] as bool
    );
  }

  static TodoEntity fromSnapShot(DocumentSnapshot snapshot) {
    return TodoEntity(
      snapshot.data['task'],
      snapshot.documentID,
      snapshot.data['note'],
      snapshot.data['complete']
    );
  }

  Map<String, Object> toDocument() {
    return {
      "complete": complete,
      "task": task,
      "note": note
    };
  }
}


import 'package:cloud_firestore/cloud_firestore.dart';

import 'task.dart';

class DataRepository {

  final CollectionReference collection =
  FirebaseFirestore.instance.collection('pets2').withConverter<Task>(
    fromFirestore: (snapshot, _) => Task.fromJson(snapshot.data()!),
    toFirestore: (task, _) => task.toJson(),
  );

  Stream<QuerySnapshot> tasks() {
    return collection
        .orderBy('order', descending: true)
    // .orderBy('isDone', descending: false)
    // .orderBy('id', descending: true)
        .snapshots(includeMetadataChanges: true);
  }

  Stream<QuerySnapshot> notDoneTasks() {
    return collection
        .orderBy('order', descending: true)
        .where('isDone', isEqualTo: false)
    // .orderBy('isDone', descending: false)
    // .orderBy('id', descending: true)
        .snapshots(includeMetadataChanges: true);
  }

  Future<DocumentReference> addTask(Task task) {
    return collection.add(task);
  }

  void onDoneChanged(Task task) async {
    print('on done ${task.toJson()}');
    await collection
        .doc(task.referenceId)
        .update(task.toJson())
        .then((value) => print('on done then '))
        .catchError((error) => print('on done error ${error}'));
  }

  void onOrderChanged(Task start, Task current) {
    deleteTask(start);
    addTask(start);
    // onDoneChanged(current) ;
  }

  void deleteTask(Task task) async {
    await collection.doc(task.referenceId).delete();
  }
}

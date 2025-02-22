import '/flutter_flow/flutter_flow_util.dart';
import 'drag_drop_widget.dart' show DragDropWidget;
import 'package:flutter/material.dart';

class DragDropModel extends FlutterFlowModel<DragDropWidget> {
  ///  Local state fields for this page.

  List<String> todo = ['Wash', 'Dress', 'Organize'];
  void addToTodo(String item) => todo.add(item);
  void removeFromTodo(String item) => todo.remove(item);
  void removeAtIndexFromTodo(int index) => todo.removeAt(index);
  void insertAtIndexInTodo(int index, String item) => todo.insert(index, item);
  void updateTodoAtIndex(int index, Function(String) updateFn) =>
      todo[index] = updateFn(todo[index]);

  List<String> doing = ['Eating'];
  void addToDoing(String item) => doing.add(item);
  void removeFromDoing(String item) => doing.remove(item);
  void removeAtIndexFromDoing(int index) => doing.removeAt(index);
  void insertAtIndexInDoing(int index, String item) =>
      doing.insert(index, item);
  void updateDoingAtIndex(int index, Function(String) updateFn) =>
      doing[index] = updateFn(doing[index]);

  List<String> done = [];
  void addToDone(String item) => done.add(item);
  void removeFromDone(String item) => done.remove(item);
  void removeAtIndexFromDone(int index) => done.removeAt(index);
  void insertAtIndexInDone(int index, String item) => done.insert(index, item);
  void updateDoneAtIndex(int index, Function(String) updateFn) =>
      done[index] = updateFn(done[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

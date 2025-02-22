import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  LatLng? _dsf = LatLng(4.1559658, 9.2632243);
  LatLng? get dsf => _dsf;
  set dsf(LatLng? value) {
    _dsf = value;
  }

  List<String> _sel = ['Hello World', 'Man', 'fdf', 'Woman', 'Boy'];
  List<String> get sel => _sel;
  set sel(List<String> value) {
    _sel = value;
  }

  void addToSel(String value) {
    sel.add(value);
  }

  void removeFromSel(String value) {
    sel.remove(value);
  }

  void removeAtIndexFromSel(int index) {
    sel.removeAt(index);
  }

  void updateSelAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    sel[index] = updateFn(_sel[index]);
  }

  void insertAtIndexInSel(int index, String value) {
    sel.insert(index, value);
  }

  List<String> _todo = ['Hello World', 'Hello gj', 'uuuu'];
  List<String> get todo => _todo;
  set todo(List<String> value) {
    _todo = value;
  }

  void addToTodo(String value) {
    todo.add(value);
  }

  void removeFromTodo(String value) {
    todo.remove(value);
  }

  void removeAtIndexFromTodo(int index) {
    todo.removeAt(index);
  }

  void updateTodoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    todo[index] = updateFn(_todo[index]);
  }

  void insertAtIndexInTodo(int index, String value) {
    todo.insert(index, value);
  }

  List<String> _doing = ['pipo'];
  List<String> get doing => _doing;
  set doing(List<String> value) {
    _doing = value;
  }

  void addToDoing(String value) {
    doing.add(value);
  }

  void removeFromDoing(String value) {
    doing.remove(value);
  }

  void removeAtIndexFromDoing(int index) {
    doing.removeAt(index);
  }

  void updateDoingAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    doing[index] = updateFn(_doing[index]);
  }

  void insertAtIndexInDoing(int index, String value) {
    doing.insert(index, value);
  }

  List<String> _EquipRent = [];
  List<String> get EquipRent => _EquipRent;
  set EquipRent(List<String> value) {
    _EquipRent = value;
  }

  void addToEquipRent(String value) {
    EquipRent.add(value);
  }

  void removeFromEquipRent(String value) {
    EquipRent.remove(value);
  }

  void removeAtIndexFromEquipRent(int index) {
    EquipRent.removeAt(index);
  }

  void updateEquipRentAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    EquipRent[index] = updateFn(_EquipRent[index]);
  }

  void insertAtIndexInEquipRent(int index, String value) {
    EquipRent.insert(index, value);
  }

  EquipOwnershipStruct _EquipExport = EquipOwnershipStruct();
  EquipOwnershipStruct get EquipExport => _EquipExport;
  set EquipExport(EquipOwnershipStruct value) {
    _EquipExport = value;
  }

  void updateEquipExportStruct(Function(EquipOwnershipStruct) updateFn) {
    updateFn(_EquipExport);
  }

  String _HTMLMessage = '';
  String get HTMLMessage => _HTMLMessage;
  set HTMLMessage(String value) {
    _HTMLMessage = value;
  }
}

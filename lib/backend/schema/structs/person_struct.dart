// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PersonStruct extends BaseStruct {
  PersonStruct({
    String? name,
    double? age,
  })  : _name = name,
        _age = age;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "age" field.
  double? _age;
  double get age => _age ?? 0.0;
  set age(double? val) => _age = val;

  void incrementAge(double amount) => age = age + amount;

  bool hasAge() => _age != null;

  static PersonStruct fromMap(Map<String, dynamic> data) => PersonStruct(
        name: data['name'] as String?,
        age: castToType<double>(data['age']),
      );

  static PersonStruct? maybeFromMap(dynamic data) =>
      data is Map ? PersonStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'age': _age,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'age': serializeParam(
          _age,
          ParamType.double,
        ),
      }.withoutNulls;

  static PersonStruct fromSerializableMap(Map<String, dynamic> data) =>
      PersonStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        age: deserializeParam(
          data['age'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'PersonStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PersonStruct && name == other.name && age == other.age;
  }

  @override
  int get hashCode => const ListEquality().hash([name, age]);
}

PersonStruct createPersonStruct({
  String? name,
  double? age,
}) =>
    PersonStruct(
      name: name,
      age: age,
    );

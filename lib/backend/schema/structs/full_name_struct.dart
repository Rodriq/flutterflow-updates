// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FullNameStruct extends BaseStruct {
  FullNameStruct({
    String? firstName,
    String? lastName,
  })  : _firstName = firstName,
        _lastName = lastName;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  static FullNameStruct fromMap(Map<String, dynamic> data) => FullNameStruct(
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
      );

  static FullNameStruct? maybeFromMap(dynamic data) =>
      data is Map ? FullNameStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'first_name': _firstName,
        'last_name': _lastName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'last_name': serializeParam(
          _lastName,
          ParamType.String,
        ),
      }.withoutNulls;

  static FullNameStruct fromSerializableMap(Map<String, dynamic> data) =>
      FullNameStruct(
        firstName: deserializeParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['last_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FullNameStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FullNameStruct &&
        firstName == other.firstName &&
        lastName == other.lastName;
  }

  @override
  int get hashCode => const ListEquality().hash([firstName, lastName]);
}

FullNameStruct createFullNameStruct({
  String? firstName,
  String? lastName,
}) =>
    FullNameStruct(
      firstName: firstName,
      lastName: lastName,
    );

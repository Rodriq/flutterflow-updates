// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EquipOwnershipStruct extends BaseStruct {
  EquipOwnershipStruct({
    List<String>? rent,
    String? name,
  })  : _rent = rent,
        _name = name;

  // "rent" field.
  List<String>? _rent;
  List<String> get rent => _rent ?? const [];
  set rent(List<String>? val) => _rent = val;

  void updateRent(Function(List<String>) updateFn) {
    updateFn(_rent ??= []);
  }

  bool hasRent() => _rent != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static EquipOwnershipStruct fromMap(Map<String, dynamic> data) =>
      EquipOwnershipStruct(
        rent: getDataList(data['rent']),
        name: data['name'] as String?,
      );

  static EquipOwnershipStruct? maybeFromMap(dynamic data) => data is Map
      ? EquipOwnershipStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'rent': _rent,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'rent': serializeParam(
          _rent,
          ParamType.String,
          isList: true,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static EquipOwnershipStruct fromSerializableMap(Map<String, dynamic> data) =>
      EquipOwnershipStruct(
        rent: deserializeParam<String>(
          data['rent'],
          ParamType.String,
          true,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'EquipOwnershipStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is EquipOwnershipStruct &&
        listEquality.equals(rent, other.rent) &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([rent, name]);
}

EquipOwnershipStruct createEquipOwnershipStruct({
  String? name,
}) =>
    EquipOwnershipStruct(
      name: name,
    );

/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, override_on_non_overriding_member, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'package:collection/collection.dart';


/** This is an auto generated class representing the Student type in your schema. */
class Student extends amplify_core.Model {
  static const classType = const _StudentModelType();
  final String id;
  final String? _studentname;
  final String? _email;
  final ClassRoom? _classRoom;
  final Proctor? _proctor;
  final List<Ondutyrequest>? _onduty;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  StudentModelIdentifier get modelIdentifier {
      return StudentModelIdentifier(
        id: id
      );
  }
  
  String? get studentname {
    return _studentname;
  }
  
  String? get email {
    return _email;
  }
  
  ClassRoom? get classRoom {
    return _classRoom;
  }
  
  Proctor? get proctor {
    return _proctor;
  }
  
  List<Ondutyrequest>? get onduty {
    return _onduty;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Student._internal({required this.id, studentname, email, classRoom, proctor, onduty, createdAt, updatedAt}): _studentname = studentname, _email = email, _classRoom = classRoom, _proctor = proctor, _onduty = onduty, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Student({String? id, String? studentname, String? email, ClassRoom? classRoom, Proctor? proctor, List<Ondutyrequest>? onduty}) {
    return Student._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      studentname: studentname,
      email: email,
      classRoom: classRoom,
      proctor: proctor,
      onduty: onduty != null ? List<Ondutyrequest>.unmodifiable(onduty) : onduty);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Student &&
      id == other.id &&
      _studentname == other._studentname &&
      _email == other._email &&
      _classRoom == other._classRoom &&
      _proctor == other._proctor &&
      DeepCollectionEquality().equals(_onduty, other._onduty);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Student {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("studentname=" + "$_studentname" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("classRoom=" + (_classRoom != null ? _classRoom!.toString() : "null") + ", ");
    buffer.write("proctor=" + (_proctor != null ? _proctor!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Student copyWith({String? studentname, String? email, ClassRoom? classRoom, Proctor? proctor, List<Ondutyrequest>? onduty}) {
    return Student._internal(
      id: id,
      studentname: studentname ?? this.studentname,
      email: email ?? this.email,
      classRoom: classRoom ?? this.classRoom,
      proctor: proctor ?? this.proctor,
      onduty: onduty ?? this.onduty);
  }
  
  Student copyWithModelFieldValues({
    ModelFieldValue<String?>? studentname,
    ModelFieldValue<String?>? email,
    ModelFieldValue<ClassRoom?>? classRoom,
    ModelFieldValue<Proctor?>? proctor,
    ModelFieldValue<List<Ondutyrequest>?>? onduty
  }) {
    return Student._internal(
      id: id,
      studentname: studentname == null ? this.studentname : studentname.value,
      email: email == null ? this.email : email.value,
      classRoom: classRoom == null ? this.classRoom : classRoom.value,
      proctor: proctor == null ? this.proctor : proctor.value,
      onduty: onduty == null ? this.onduty : onduty.value
    );
  }
  
  Student.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _studentname = json['studentname'],
      _email = json['email'],
      _classRoom = json['classRoom'] != null
        ? json['classRoom']['serializedData'] != null
          ? ClassRoom.fromJson(new Map<String, dynamic>.from(json['classRoom']['serializedData']))
          : ClassRoom.fromJson(new Map<String, dynamic>.from(json['classRoom']))
        : null,
      _proctor = json['proctor'] != null
        ? json['proctor']['serializedData'] != null
          ? Proctor.fromJson(new Map<String, dynamic>.from(json['proctor']['serializedData']))
          : Proctor.fromJson(new Map<String, dynamic>.from(json['proctor']))
        : null,
      _onduty = json['onduty']  is Map
        ? (json['onduty']['items'] is List
          ? (json['onduty']['items'] as List)
              .where((e) => e != null)
              .map((e) => Ondutyrequest.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['onduty'] is List
          ? (json['onduty'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => Ondutyrequest.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'studentname': _studentname, 'email': _email, 'classRoom': _classRoom?.toJson(), 'proctor': _proctor?.toJson(), 'onduty': _onduty?.map((Ondutyrequest? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'studentname': _studentname,
    'email': _email,
    'classRoom': _classRoom,
    'proctor': _proctor,
    'onduty': _onduty,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<StudentModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<StudentModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final STUDENTNAME = amplify_core.QueryField(fieldName: "studentname");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final CLASSROOM = amplify_core.QueryField(
    fieldName: "classRoom",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'ClassRoom'));
  static final PROCTOR = amplify_core.QueryField(
    fieldName: "proctor",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Proctor'));
  static final ONDUTY = amplify_core.QueryField(
    fieldName: "onduty",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Ondutyrequest'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Student";
    modelSchemaDefinition.pluralName = "Students";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.GROUPS,
        groupClaim: "cognito:groups",
        groups: [ "ADMINS", "STAFF", "STUDENTS" ],
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Student.STUDENTNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Student.EMAIL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Student.CLASSROOM,
      isRequired: false,
      targetNames: ['classRoomid'],
      ofModelName: 'ClassRoom'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Student.PROCTOR,
      isRequired: false,
      targetNames: ['proctorid'],
      ofModelName: 'Proctor'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Student.ONDUTY,
      isRequired: false,
      ofModelName: 'Ondutyrequest',
      associatedKey: Ondutyrequest.STUDENT
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _StudentModelType extends amplify_core.ModelType<Student> {
  const _StudentModelType();
  
  @override
  Student fromJson(Map<String, dynamic> jsonData) {
    return Student.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Student';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Student] in your schema.
 */
class StudentModelIdentifier implements amplify_core.ModelIdentifier<Student> {
  final String id;

  /** Create an instance of StudentModelIdentifier using [id] the primary key. */
  const StudentModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'StudentModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is StudentModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}
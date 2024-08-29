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


/** This is an auto generated class representing the EventDetails type in your schema. */
class EventDetails {
  final List<String>? _eventimage;
  final String? _eventname;
  final String? _eventdetails;
  final String? _registerurl;
  final String? _date;
  final String? _eventlocation;

  List<String>? get eventimage {
    return _eventimage;
  }
  
  String? get eventname {
    return _eventname;
  }
  
  String? get eventdetails {
    return _eventdetails;
  }
  
  String? get registerurl {
    return _registerurl;
  }
  
  String? get date {
    return _date;
  }
  
  String? get eventlocation {
    return _eventlocation;
  }
  
  const EventDetails._internal({eventimage, eventname, eventdetails, registerurl, date, eventlocation}): _eventimage = eventimage, _eventname = eventname, _eventdetails = eventdetails, _registerurl = registerurl, _date = date, _eventlocation = eventlocation;
  
  factory EventDetails({List<String>? eventimage, String? eventname, String? eventdetails, String? registerurl, String? date, String? eventlocation}) {
    return EventDetails._internal(
      eventimage: eventimage != null ? List<String>.unmodifiable(eventimage) : eventimage,
      eventname: eventname,
      eventdetails: eventdetails,
      registerurl: registerurl,
      date: date,
      eventlocation: eventlocation);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventDetails &&
      DeepCollectionEquality().equals(_eventimage, other._eventimage) &&
      _eventname == other._eventname &&
      _eventdetails == other._eventdetails &&
      _registerurl == other._registerurl &&
      _date == other._date &&
      _eventlocation == other._eventlocation;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("EventDetails {");
    buffer.write("eventimage=" + (_eventimage != null ? _eventimage!.toString() : "null") + ", ");
    buffer.write("eventname=" + "$_eventname" + ", ");
    buffer.write("eventdetails=" + "$_eventdetails" + ", ");
    buffer.write("registerurl=" + "$_registerurl" + ", ");
    buffer.write("date=" + "$_date" + ", ");
    buffer.write("eventlocation=" + "$_eventlocation");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  EventDetails copyWith({List<String>? eventimage, String? eventname, String? eventdetails, String? registerurl, String? date, String? eventlocation}) {
    return EventDetails._internal(
      eventimage: eventimage ?? this.eventimage,
      eventname: eventname ?? this.eventname,
      eventdetails: eventdetails ?? this.eventdetails,
      registerurl: registerurl ?? this.registerurl,
      date: date ?? this.date,
      eventlocation: eventlocation ?? this.eventlocation);
  }
  
  EventDetails copyWithModelFieldValues({
    ModelFieldValue<List<String>?>? eventimage,
    ModelFieldValue<String?>? eventname,
    ModelFieldValue<String?>? eventdetails,
    ModelFieldValue<String?>? registerurl,
    ModelFieldValue<String?>? date,
    ModelFieldValue<String?>? eventlocation
  }) {
    return EventDetails._internal(
      eventimage: eventimage == null ? this.eventimage : eventimage.value,
      eventname: eventname == null ? this.eventname : eventname.value,
      eventdetails: eventdetails == null ? this.eventdetails : eventdetails.value,
      registerurl: registerurl == null ? this.registerurl : registerurl.value,
      date: date == null ? this.date : date.value,
      eventlocation: eventlocation == null ? this.eventlocation : eventlocation.value
    );
  }
  
  EventDetails.fromJson(Map<String, dynamic> json)  
    : _eventimage = json['eventimage']?.cast<String>(),
      _eventname = json['eventname'],
      _eventdetails = json['eventdetails'],
      _registerurl = json['registerurl'],
      _date = json['date'],
      _eventlocation = json['eventlocation'];
  
  Map<String, dynamic> toJson() => {
    'eventimage': _eventimage, 'eventname': _eventname, 'eventdetails': _eventdetails, 'registerurl': _registerurl, 'date': _date, 'eventlocation': _eventlocation
  };
  
  Map<String, Object?> toMap() => {
    'eventimage': _eventimage,
    'eventname': _eventname,
    'eventdetails': _eventdetails,
    'registerurl': _registerurl,
    'date': _date,
    'eventlocation': _eventlocation
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "EventDetails";
    modelSchemaDefinition.pluralName = "EventDetails";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'eventimage',
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'eventname',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'eventdetails',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'registerurl',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'date',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'eventlocation',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}
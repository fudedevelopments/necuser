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


/** This is an auto generated class representing the ListEvents type in your schema. */
class ListEvents {
  final List<String>? _items;
  final String? _nextToken;
  final int? _scannedCount;

  List<String>? get items {
    return _items;
  }
  
  String? get nextToken {
    return _nextToken;
  }
  
  int? get scannedCount {
    return _scannedCount;
  }
  
  const ListEvents._internal({items, nextToken, scannedCount}): _items = items, _nextToken = nextToken, _scannedCount = scannedCount;
  
  factory ListEvents({List<String>? items, String? nextToken, int? scannedCount}) {
    return ListEvents._internal(
      items: items != null ? List<String>.unmodifiable(items) : items,
      nextToken: nextToken,
      scannedCount: scannedCount);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListEvents &&
      DeepCollectionEquality().equals(_items, other._items) &&
      _nextToken == other._nextToken &&
      _scannedCount == other._scannedCount;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ListEvents {");
    buffer.write("items=" + (_items != null ? _items!.toString() : "null") + ", ");
    buffer.write("nextToken=" + "$_nextToken" + ", ");
    buffer.write("scannedCount=" + (_scannedCount != null ? _scannedCount!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ListEvents copyWith({List<String>? items, String? nextToken, int? scannedCount}) {
    return ListEvents._internal(
      items: items ?? this.items,
      nextToken: nextToken ?? this.nextToken,
      scannedCount: scannedCount ?? this.scannedCount);
  }
  
  ListEvents copyWithModelFieldValues({
    ModelFieldValue<List<String>?>? items,
    ModelFieldValue<String?>? nextToken,
    ModelFieldValue<int?>? scannedCount
  }) {
    return ListEvents._internal(
      items: items == null ? this.items : items.value,
      nextToken: nextToken == null ? this.nextToken : nextToken.value,
      scannedCount: scannedCount == null ? this.scannedCount : scannedCount.value
    );
  }
  
  ListEvents.fromJson(Map<String, dynamic> json)  
    : _items = json['items']?.cast<String>(),
      _nextToken = json['nextToken'],
      _scannedCount = (json['scannedCount'] as num?)?.toInt();
  
  Map<String, dynamic> toJson() => {
    'items': _items, 'nextToken': _nextToken, 'scannedCount': _scannedCount
  };
  
  Map<String, Object?> toMap() => {
    'items': _items,
    'nextToken': _nextToken,
    'scannedCount': _scannedCount
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ListEvents";
    modelSchemaDefinition.pluralName = "ListEvents";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'items',
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'nextToken',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'scannedCount',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
  });
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$QuerySortingToJson(QuerySorting instance) =>
    <String, dynamic>{
      'path': instance.path,
      'asc': instance.asc,
    };

Map<String, dynamic> _$QueryToJson(Query instance) => <String, dynamic>{
      'table': instance.table,
      'select': instance.select,
      'sorting': instance.sorting,
      'filter': instance.filter,
      'count': instance.count,
      'top': instance.top,
      'skip': instance.skip,
      'distinct': instance.distinct,
      'params': instance.params,
    };

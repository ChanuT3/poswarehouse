// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Parade _$ParadeFromJson(Map<String, dynamic> json) => Parade(
      json['current_page'] as int,
      (json['data'] as List<dynamic>?)
          ?.map((e) => Parades.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['first_page_url'] as String?,
      json['from'] as int?,
      json['last_page'] as int?,
      json['last_page_url'] as String?,
      json['path'] as String?,
      json['per_page'] as int?,
      json['to'] as int?,
      json['total'] as int?,
    );

Map<String, dynamic> _$ParadeToJson(Parade instance) => <String, dynamic>{
      'current_page': instance.current_page,
      'data': instance.data,
      'first_page_url': instance.first_page_url,
      'from': instance.from,
      'last_page': instance.last_page,
      'last_page_url': instance.last_page_url,
      'path': instance.path,
      'per_page': instance.per_page,
      'to': instance.to,
      'total': instance.total,
    };

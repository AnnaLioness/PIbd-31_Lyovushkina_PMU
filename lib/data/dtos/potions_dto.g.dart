// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'potions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PotionsDto _$PotionsDtoFromJson(Map<String, dynamic> json) => PotionsDto(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PotionDataDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : MetaDto.fromJson(json['meta'] as Map<String, dynamic>),
    );

MetaDto _$MetaDtoFromJson(Map<String, dynamic> json) => MetaDto(
      pagination: json['pagination'] == null
          ? null
          : PaginationDto.fromJson(json['pagination'] as Map<String, dynamic>),
    );

PaginationDto _$PaginationDtoFromJson(Map<String, dynamic> json) =>
    PaginationDto(
      current: (json['current'] as num?)?.toInt(),
      next: (json['next'] as num?)?.toInt(),
      last: (json['last'] as num?)?.toInt(),
      records: (json['records'] as num?)?.toInt(),
    );

PotionDataDto _$PotionDataDtoFromJson(Map<String, dynamic> json) =>
    PotionDataDto(
      id: json['id'] as String?,
      type: json['type'] as String?,
      attributes: json['attributes'] == null
          ? null
          : PotionAttributesDataDto.fromJson(
              json['attributes'] as Map<String, dynamic>),
    );

PotionAttributesDataDto _$PotionAttributesDataDtoFromJson(
        Map<String, dynamic> json) =>
    PotionAttributesDataDto(
      name: json['name'] as String?,
      characteristics: json['characteristics'] as String?,
      effect: json['effect'] as String?,
      ingredients: json['ingredients'] as String?,
      image: json['image'] as String?,
    );

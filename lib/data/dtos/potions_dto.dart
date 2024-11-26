import 'package:json_annotation/json_annotation.dart';
part 'potions_dto.g.dart';

@JsonSerializable(createToJson: false)
class PotionsDto {
  final List<PotionDataDto>? data;
  final MetaDto? meta;
  const PotionsDto({
    this.data,
    this.meta,
  });

  factory PotionsDto.fromJson(Map<String, dynamic> json) => _$PotionsDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class MetaDto {
  final PaginationDto? pagination;

  const MetaDto({this.pagination});

  factory MetaDto.fromJson(Map<String, dynamic> json) => _$MetaDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class PaginationDto {
  final int? current;
  final int? next;
  final int? last;
  final int? records;

  const PaginationDto({this.current, this.next, this.last, this.records});

  factory PaginationDto.fromJson(Map<String, dynamic> json) => _$PaginationDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class PotionDataDto {
  final String? id;
  final String? type;
  final PotionAttributesDataDto? attributes;

  const PotionDataDto({
    this.id,
    this.type,
    this.attributes,
  });

  factory PotionDataDto.fromJson(Map<String, dynamic> json) => _$PotionDataDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class PotionAttributesDataDto {
  final String? name;
  final String? characteristics;
  final String? effect;
  final String? ingredients;
  final String? image;
  const PotionAttributesDataDto({
    this.name, //название
    this.characteristics, //характеристики
    this.effect, //эффект
    this.ingredients, //ингредиенты
    this.image, //картинка
  });
  factory PotionAttributesDataDto.fromJson(Map<String, dynamic> json) =>
      _$PotionAttributesDataDtoFromJson(json);
}

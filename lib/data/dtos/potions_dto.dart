import 'package:json_annotation/json_annotation.dart';
part 'potions_dto.g.dart';

@JsonSerializable(createToJson: false)
class PotionsDto{
  final List<PotionDataDto>? data;

  const PotionsDto({
  this.data,
  });

  factory PotionsDto.fromJson(Map<String, dynamic> json) =>
      _$PotionsDtoFromJson(json);
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

  factory PotionDataDto.fromJson(Map<String, dynamic> json) =>
      _$PotionDataDtoFromJson(json);
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
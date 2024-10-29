import '../../domain/models/card.dart';
import '../dtos/potions_dto.dart';
import '';
const _imagePlaceHolder = 'https://sun1-23.userapi.com/s/v1/ig2/GpHU-OEKzKxs0YZH2MA2HoB1RBQFES_diFU0sJ-x3Yf21B9jp-fH9sqB4rhRy2qXzlRmghIOjyfQTcb-r89Z2gBG.jpg?size=526x541&quality=95&crop=70,0,526,541&ava=1';
extension PotionsDataDtoToModel on PotionDataDto {
  CardData toDomain() => CardData(
    attributes?.name ?? 'UNKNOWN',
    image: attributes?.image ?? _imagePlaceHolder,
    description: _makeDescription(attributes),
  );
}
String _makeDescription(PotionAttributesDataDto? attributes){
  return 'characteristics: ${attributes?.characteristics ?? 'UNKNOWN'},\n'
      'effect: ${attributes?.effect ?? 'UNKNOWN'},\n'
      'ingredients: ${attributes?.ingredients ?? 'UNKNOWN'}'
  ;
}

import '../../domain/models/card.dart';
import '../../domain/models/home.dart';
import 'api_interface.dart';
class MockRepository extends ApiInterface {
  @override
  Future<HomeData?> loadData({OnErrorCallback? onError}) async {
    return HomeData(
      data: [
      CardData(
        'Ромео и Джулиетта',
        description: 'быть может, твой единственный алмаз простым стеклом покажется на глаз',
        image: 'https://avatars.dzeninfra.ru/get-zen_doc/271828/pub_660f0ff5d45a53675bbdc247_660f11a7d45a53675bbf9e04/scale_1200',
      ),
      CardData(
          'Гамлет',
          description: 'подарок нам не мил, когда разлюбит тот, кто подарил',
          image: 'https://wildfauna.ru/wp-content/uploads/2019/03/mangust-24.jpg'
      ),
      CardData(
        'Ромео и Джулиетта',
        description: 'роза пахнет розой, хоть розой назови её, хоть нет',
        image: 'https://i.pinimg.com/736x/a4/12/d2/a412d2b34b122778ce0438376de72ce4--west-indies-mongoose.jpg',
      ),
      CardData(
          'Макбет',
          description: 'кажись цветком и будь змеёй под ним',
          image: 'https://avatars.mds.yandex.net/i?id=377eb3486621069ac13b04f30d3aed57_l-5301760-images-thumbs&n=13'
      ),
    ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../domain/models/card.dart';
import '../details_page/details_page.dart';

part 'card.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(widget.title),
      ),
      backgroundColor: Colors.orangeAccent,
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});


  @override
  Widget build(BuildContext context) {
    final data = [
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
      )
    ];
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: data.map((e) => _MyCardWidget.formData(e,
            onLike: (bool isLiked) {
              _showSnackBar(context, isLiked);
            },
            onTap: () => _navToDetails(context, e),
          )).toList(),
        ),
      ),
    );
  }
  void _showSnackBar(BuildContext context, bool isLiked) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Вы ${isLiked ? 'лайкнули' : 'убрали лайк с'} мангуста',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        backgroundColor: Colors.orangeAccent,
        duration: const Duration(seconds: 2),
      ));
    });
  }
  void _navToDetails(BuildContext context, CardData data) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => DetailsPage(data)),
    );
  }
}


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
      home: const MyHomePage(title: 'Лёвушкина Анна Александровна'),
    );
  }
}

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
      body: const MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});


  @override
  Widget build(BuildContext context) {
    final data = [
      _CardData(
          'Ромео и Джулиетта',
          description: 'быть может, твой единственный алмаз простым стеклом покажется на глаз',
          image: 'https://avatars.dzeninfra.ru/get-zen_doc/271828/pub_660f0ff5d45a53675bbdc247_660f11a7d45a53675bbf9e04/scale_1200',
      ),
      _CardData(
          'Гамлет',
          description: 'подарок нам не мил, когда разлюбит тот, кто подарил',
          image: 'https://wildfauna.ru/wp-content/uploads/2019/03/mangust-24.jpg'
      ),
      _CardData(
          'Ромео и Джулиетта',
          description: 'роза пахнет розой, хоть розой назови её, хоть нет',
          image: 'https://i.pinimg.com/736x/a4/12/d2/a412d2b34b122778ce0438376de72ce4--west-indies-mongoose.jpg',
      ),
      _CardData(
          'Макбет',
          description: 'кажись цветком и будь змеёй под ним',
          image: 'https://avatars.mds.yandex.net/i?id=377eb3486621069ac13b04f30d3aed57_l-5301760-images-thumbs&n=13'
      )
    ];
    return Center(
      child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: data.map((e) => _MyCardWidget.formData(e)).toList(),
      ),
    ),
    );
  }
}
class _CardData {
  final String text;
  final String description;
  final String? image;

  _CardData(
      this.text, {
        required this.description,
        this.image,
      });
}

class _MyCardWidget extends StatelessWidget {
  final String text;
  final String description;
  final String? image;
  const _MyCardWidget(
    this.text, {
        required this.description,
        this.image,
      });
  factory _MyCardWidget.formData(_CardData data) => _MyCardWidget(
      data.text,
      description: data.description,
      image: data.image,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.deepOrangeAccent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.red,
          width: 3,
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 200,
                width: 150,
                  child: Image.network(
                    image ?? '',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Placeholder(),
                  ),
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

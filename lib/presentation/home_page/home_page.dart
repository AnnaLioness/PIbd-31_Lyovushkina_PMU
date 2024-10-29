import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pmu_labs/data/repositories/mock_repository.dart';
import '../../data/repositories/potter_repository.dart';
import '../../domain/models/card.dart';
import '../details_page/details_page.dart';
import '../dialogs/show_dialog.dart';

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
        backgroundColor: Colors.purple,
        title: Text(widget.title),
      ),
      backgroundColor: Colors.lightGreenAccent,
      body: const Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final searchController = TextEditingController();
  late Future<List<CardData>?> data;
  final repo = PotterRepository();
  bool isLoading = false;

  @override
  void initState() {
    data = repo.loadData(onError: (e) => showErrorDialog(context, error: e));
    isLoading = true;
    data.then((_) => setState(() {
      isLoading = false; // Остановить индикатор при завершении загрузки
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child : Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: CupertinoSearchTextField(
              controller: searchController,
              onChanged: (search) {
                setState( () {
                  data = repo.loadData(q: search);
                });
              },
            ),
          ),
      Expanded(
      child: Center(
        child: FutureBuilder<List<CardData>?>(
          future: data,
          builder: (context, snapshot) => SingleChildScrollView(
          child: snapshot.hasData
            ?Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: snapshot.data?.map((data) {
              return _MyCardWidget.formData(
                  data,
                  onLike: (bool isLiked) {
                  _showSnackBar(context, isLiked);
                  },
                  onTap: () => _navToDetails(context, data),
              );
              }).toList() ??
              [],
            )
              :const CircularProgressIndicator(),
          ),
        ),
      ),
      ),
      ],
    ),
    );
  }
  void _showSnackBar(BuildContext context, bool isLiked) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Вы ${isLiked ? 'лайкнули зелье' : 'убрали лайк с зелья'}',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        backgroundColor: Colors.lightGreenAccent,
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


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmu_labs/components/extensions/context_x.dart';
import 'package:pmu_labs/components/utils/debounce.dart';
import 'package:pmu_labs/data/repositories/mock_repository.dart';
import 'package:pmu_labs/presentation/home_page/bloc/bloc.dart';
import 'package:pmu_labs/presentation/home_page/bloc/events.dart';
import 'package:pmu_labs/presentation/home_page/bloc/state.dart';
import '../../data/repositories/potter_repository.dart';
import '../../domain/models/card.dart';
import '../common/svg_objects.dart';
import '../details_page/details_page.dart';
import '../dialogs/show_dialog.dart';
import '../like_bloc/like_bloc.dart';
import '../like_bloc/like_event.dart';
import '../like_bloc/like_state.dart';
import '../locale_bloc/locale_bloc.dart';
import '../locale_bloc/locale_events.dart';
import '../locale_bloc/locale_state.dart';

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
  /*late Future<List<CardData>?> data;
  final repo = PotterRepository();
  bool isLoading = false;*/
  final scrollController = ScrollController();

  @override
  void initState() {
    SvgObjects.init();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(const HomeLoadDataEvent());
      context.read<LikeBloc>().add(const LoadLikesEvent());
    });
    scrollController.addListener(_onNextPageListener);
    super.initState();
  }

  void _onNextPageListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent) {
      // preventing multiple pagination request on multiple swipes
      final bloc = context.read<HomeBloc>();
      if (!bloc.state.isPaginationLoading) {
        bloc.add(HomeLoadDataEvent(
          search: searchController.text,
          nextPage: bloc.state.data?.nextPage,
        ));
      }
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(
        children: [
          Row(
            children: [
            Expanded(
              flex: 4,
              child:Padding(
                padding: const EdgeInsets.all(12),
            child: CupertinoSearchTextField(
              placeholder: context.locale.search,
              controller: searchController,
              onChanged: (search) {
                Debounce.run(() => context.read<HomeBloc>().add(HomeLoadDataEvent(search: search)));
              },
            ),
          ),
            ),
          GestureDetector(
            onTap: () => context.read<LocaleBloc>().add(const ChangeLocaleEvent()),
            child: SizedBox.square(
              dimension: 50,
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: BlocBuilder<LocaleBloc, LocaleState>(
                  builder: (context, state) {
                    return state.currentLocale.languageCode == 'ru'
                        ? const SvgRu()
                        : const SvgUk();
                  },
                ),
              ),
            ),
          ),
          ],
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) => state.error != null
                ? Text(
                    state.error ?? '',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.red),
                  )
                : state.isLoading
                    ? const CircularProgressIndicator()
                    : BlocBuilder<LikeBloc, LikeState>(
                      builder: (context, likeState) {
                      return Expanded(
                        child: RefreshIndicator(
                        onRefresh: _onRefresh,
                        child: ListView.builder(
                        controller: scrollController,
                        padding: EdgeInsets.zero,
                        itemCount: state.data?.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          final data = state.data?.data?[index];
                          return data != null
                          ? _MyCardWidget.formData(
                            data,
                            onLike: _onLike,
                            isLiked: likeState.likedIds
                            ?.contains(data.id) ==
                                true,
                              onTap: () => _navToDetails(context, data),
                          )
                          : const SizedBox.shrink();
                        },
                      ),
                    ),
                );
              },
            ),
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) => state.isPaginationLoading
                ? const CircularProgressIndicator()
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String title, bool isLiked) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          ' $title ${isLiked ? context.locale.liked : context.locale.unliked}',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        backgroundColor: Colors.lightGreenAccent,
        duration: const Duration(seconds: 2),
      ));
    });
  }
  void _onLike(String? id, String title, bool isLiked) {
    if (id != null) {
      context.read<LikeBloc>().add(ChangeLikeEvent(id));
      _showSnackBar(context, title, !isLiked);
    }
  }
  void _navToDetails(BuildContext context, CardData data) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => DetailsPage(data)),
    );
  }

  Future<void> _onRefresh() {
    context.read<HomeBloc>().add(HomeLoadDataEvent(search: searchController.text));
    return Future.value(null);
  }
}

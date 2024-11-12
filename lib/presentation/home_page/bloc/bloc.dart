import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmu_labs/data/repositories/potter_repository.dart';
import 'package:pmu_labs/presentation/home_page/bloc/events.dart';
import 'package:pmu_labs/presentation/home_page/bloc/state.dart';
class HomeBloc extends Bloc<HomeEvent, HomeState>{
  final PotterRepository repo;
  HomeBloc(this.repo) : super(const HomeState()){
    on<HomeLoadDataEvent>(_onLoadData);
  }
  void _onLoadData(HomeLoadDataEvent event, Emitter<HomeState> emit){
    emit(state.copyWit(data: repo.loadData()));
  }
}
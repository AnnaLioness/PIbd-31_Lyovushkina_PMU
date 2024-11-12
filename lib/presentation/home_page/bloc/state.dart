import 'package:equatable/equatable.dart';
import 'package:pmu_labs/domain/models/card.dart';
class HomeState extends Equatable{
  final Future<List<CardData>?>? data;
  const HomeState({this.data});
  HomeState copyWit({Future<List<CardData>?>? data}) => HomeState(data: data ?? this.data);
  @override
  List<Object?> get props => [data];
}
import '../../domain/models/card.dart';

typedef OnErrorCallback = void Function(String? error);

abstract class ApiInterface {
  Future<List<CardData>?> loadData({OnErrorCallback? onError});
}
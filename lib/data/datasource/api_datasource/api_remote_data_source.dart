import 'package:news_c16_mon/data/models/sources_response.dart';

abstract interface class ApiRemoteDataSource {
  Future<List<Sources>> getSources(String categoryId);
}

import 'package:news_c16_mon/data/models/sources_response.dart';

abstract interface class FirebaseRemoteDataSource {
  Future<void> saveSource(List<Sources> sources, String categoryId);

  Future<List<Sources>> getSourcesList(String categoryId);
}

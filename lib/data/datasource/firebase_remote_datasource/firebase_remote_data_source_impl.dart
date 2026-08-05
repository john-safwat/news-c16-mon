import 'package:news_c16_mon/data/datasource/firebase_remote_datasource/firebase_remote_data_source.dart';
import 'package:news_c16_mon/data/firebase/firebase_service.dart';
import 'package:news_c16_mon/data/models/sources_response.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  FirebaseService firebaseService = FirebaseService();


  @override
  Future<void> saveSource(List<Sources> sources, String categoryId) async {
    try {
      await firebaseService.addSourcesList(sources, categoryId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Sources>> getSourcesList(String categoryId) async {
    try {
      var sources = await firebaseService.getSources(categoryId);
      return sources;
    } catch (e) {
      rethrow;
    }
  }
}

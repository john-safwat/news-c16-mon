import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_c16_mon/data/datasource/api_datasource/api_remote_data_source.dart';
import 'package:news_c16_mon/data/datasource/firebase_remote_datasource/firebase_remote_data_source.dart';
import 'package:news_c16_mon/data/mappers/sources_mapper.dart';
import 'package:news_c16_mon/domain/entity/source_entity.dart';
import 'package:news_c16_mon/domain/repository/sources_repository.dart';

class SourcesRepositoryImpl implements SourcesRepository {
  ApiRemoteDataSource apiRemoteDataSource;
  FirebaseRemoteDataSource firebaseRemoteDataSource;

  SourcesMapper mapper;

  SourcesRepositoryImpl(
    this.apiRemoteDataSource,
    this.firebaseRemoteDataSource,
    this.mapper,
  );

  @override
  Future<List<SourceEntity>> getSourcesList(String categoryId) async {
    try {
      var connected = await _isConnected();
      if (connected) {
        var sources = await apiRemoteDataSource.getSources(categoryId);
        firebaseRemoteDataSource.saveSource(sources, categoryId);
        return mapper.convertFromSourceToSourceEntity(sources);
      } else {
        return _getSourceFromFirebase(categoryId);
      }
    } catch (e) {
      try {
        return _getSourceFromFirebase(categoryId);
      } catch (e) {
        rethrow;
      }
    }
  }

  Future<bool> _isConnected() async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    return (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.ethernet) ||
        connectivityResult.contains(ConnectivityResult.wifi));
  }

  Future<List<SourceEntity>> _getSourceFromFirebase(String categoryId) async {
    var source = await firebaseRemoteDataSource.getSourcesList(categoryId);
    return mapper.convertFromSourceToSourceEntity(source);
  }
}

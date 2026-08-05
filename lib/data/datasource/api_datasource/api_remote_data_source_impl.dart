import 'package:news_c16_mon/data/api/api_client.dart';
import 'package:news_c16_mon/data/api/provide_dio.dart';
import 'package:news_c16_mon/data/datasource/api_datasource/api_remote_data_source.dart';
import 'package:news_c16_mon/data/models/sources_response.dart';

class ApiRemoteDataSourceImpl implements ApiRemoteDataSource {
  ApiClient apiClient = ApiClient(provideDio());

  @override
  Future<List<Sources>> getSources(String categoryId) async {
    try {
      var response = await apiClient.getSources(categoryId);
      return response.sources ?? [];
    } catch (e) {
      rethrow;
    }
  }
}

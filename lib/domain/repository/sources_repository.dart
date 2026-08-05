import 'package:news_c16_mon/data/models/sources_response.dart';
import 'package:news_c16_mon/domain/entity/source_entity.dart';

abstract interface class SourcesRepository {
  Future<List<SourceEntity>> getSourcesList(String categoryId);
}

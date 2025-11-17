import 'package:news_c16_mon/domain/entity/source_entity.dart';
import 'package:news_c16_mon/domain/repository/sources_repository.dart';

class GetSourcesUseCase {
  SourcesRepository repository;

  GetSourcesUseCase(this.repository);

  Future<List<SourceEntity>> getSources(String categoryId) {
    return repository.getSourcesList(categoryId);
  }
}

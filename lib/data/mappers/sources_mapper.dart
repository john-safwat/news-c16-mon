import 'package:news_c16_mon/data/models/sources_response.dart';
import 'package:news_c16_mon/domain/entity/source_entity.dart';
import 'package:news_c16_mon/main.dart';

class SourcesMapper {
  List<SourceEntity> convertFromSourceToSourceEntity(List<Sources> sources) {
    List<SourceEntity> entities = [];
    for (var source in sources) {
      var name = locale == "en" ? source.nameEn : source.nameAr;
      entities.add(SourceEntity(source.id, name, source.category));
    }
    return entities;
  }
}

import 'package:newshttp/source/data/data_source/source_data_source.dart';
import 'package:newshttp/source/data/data_source/sources_repo.dart';
import 'package:newshttp/source/data/models/source_model.dart';

class SourcesRepositry{
  final SourcesDataSource sourcesDataSource;

  SourcesRepositry( this.sourcesDataSource);

  @override
  Future<List<Sources>> getSources(String categoryId) {
    // TODO: implement getSources
    return sourcesDataSource.getSources(categoryId);
  }
  // Future<List<Sources>>getSources(String categoryId)async{
  //   return sourcesApiDataSource.getSources(categoryId);
  // }
}
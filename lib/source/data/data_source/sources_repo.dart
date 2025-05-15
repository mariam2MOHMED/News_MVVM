import 'package:newshttp/source/data/models/source_model.dart';

abstract class SourcesDataSource{

  Future<List<Sources>>getSources(String categoryId);
}
import 'package:newshttp/news/data/data_sources/news_data_sources.dart';
import 'package:newshttp/news/data/news_data_sources/news_data_source.dart';
import 'package:newshttp/source/data/data_source/source_data_source.dart';
import 'package:newshttp/source/data/data_source/sources_repo.dart';

class ServicesLocator{
  static SourcesDataSource sourcesDataSource=
  SourcesApiDataSource();
  static NewsDataSources newsDataSources =
  NewsApiDataSource();
}
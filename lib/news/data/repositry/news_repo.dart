import 'package:newshttp/news/data/data_sources/news_data_sources.dart';
import 'package:newshttp/news/data/models/news_model.dart';

class NewsRepositry{
  final NewsDataSources newsDataSources;

  NewsRepositry({required this.newsDataSources});
  Future<List<Articles>>getNews(String SourceId)async{
    return newsDataSources.getNews(sourceId: SourceId);
  }
}
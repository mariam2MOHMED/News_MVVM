import 'package:newshttp/news/data/models/news_model.dart';

abstract class NewsDataSources{
  Future <List<Articles>> getNews({String? sourceId, String? query, int? page});
}
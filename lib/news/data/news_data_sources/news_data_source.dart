import 'dart:convert';

import 'package:newshttp/news/data/data_sources/news_data_sources.dart';
import 'package:newshttp/shared/api_constants.dart';
import 'package:newshttp/news/data/models/news_model.dart';
import 'package:http/http.dart'as http;
class NewsApiDataSource extends NewsDataSources{


  @override
  Future<List<Articles>> getNews(  {String?
  sourceId, String? query,int? page})async{
   final url=Uri.https(ApiConstants.url,
       ApiConstants.newsEndPoint,{
         'sources':sourceId,
         'apiKey':ApiConstants.apiKey,
         'q':query,
         'pageSize':'10',
         'page':page.toString()

       });
   final response=await http.get(url);
   final json=jsonDecode(response.body);
   print("Response Body: ${response.body}");
   final newsResponse= NewsModel.fromJson(json);
   if (newsResponse.status == 'ok'
       && newsResponse.articles != null) {
     return newsResponse.articles!;
   } else {
     print( "${json['message'] ?? 'Unknown error'}");
     throw Exception("Failed to fetch news: "
         "${json['message'] ?? 'Unknown error'}");
   }
}
}
import "dart:convert";

import"package:http/http.dart" as http;
import "package:newshttp/shared/api_constants.dart";


import "../news/data/models/news_model.dart";
import "../source/data/models/source_model.dart";
class ApiServices{
  static Future<NewsModel>  getNews(
      {String?
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
    return NewsModel.fromJson(json);
  }

}
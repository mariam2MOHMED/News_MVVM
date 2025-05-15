import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:newshttp/shared/api_constants.dart';
import 'package:http/http.dart'as http;
import 'package:newshttp/source/data/data_source/sources_repo.dart';
import '../models/source_model.dart';

class SourcesApiDataSource extends SourcesDataSource {
   Future<List<Sources>> getSources(String category)
  async{
    final url=Uri.https(ApiConstants.url,
        ApiConstants.source, {
          'category':category,
          'apiKey':ApiConstants.apiKey,
          'language':'en'
        });
    final response=await http.get(url);
    final json=jsonDecode(response.body);

    final sourceResponse= SourceModel.fromJson(json);
if(sourceResponse.status=='ok'&&sourceResponse.sources!=null){
return sourceResponse.sources!;
}else{
 throw Exception('Failed to  ');
}
  }
}
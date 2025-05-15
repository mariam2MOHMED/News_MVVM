import 'package:flutter/material.dart';
import 'package:newshttp/news/view/widgets/news_detials.dart';
import 'package:newshttp/news/view/widgets/news_item.dart';
import 'package:newshttp/shared/widgets/error_widget.dart';
import 'package:newshttp/shared/widgets/loading_eidget.dart';


import '../api_managers/api_services.dart';
import '../news/data/models/news_model.dart';

class SearchTab extends SearchDelegate{

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      hintColor: Colors.grey,
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),

    );
  }
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    [

      IconButton(onPressed: (){
        showResults(context);
      }, icon: Icon(Icons.search,
        color: Colors.grey,))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
  return IconButton(onPressed: (){
    Navigator.pop(context);
  }, icon: Icon(Icons.arrow_back_sharp,
    color: Colors.grey,));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return  FutureBuilder(future: ApiServices.
    getNews(query: query), builder: (context,snapshot){
      if(snapshot.connectionState==ConnectionState.waiting){
        return LoadingWidget();
      }else if(snapshot.hasData
          && snapshot.data?.articles != null){

        return

          Container(
            width: double.infinity,
            height:double.infinity,
            decoration: BoxDecoration(color: Colors.white,
                image: DecorationImage(image:
                AssetImage("assets/images/pattern.png"),
                    fit: BoxFit.fill)
            ),
            child: ListView.separated(

              itemBuilder: (context,index){
                final    articles=
                    snapshot.data!.articles!??[];
                return  InkWell(
                  onTap: (){
                    Navigator.pushNamed(context,
                        NewsDetials.routeName,arguments: articles[index]);
                  },
                  child: NewsItem(
                    news: snapshot.data?.articles?[index] ??
                        Articles(),
                  ),
                );
              }, separatorBuilder: (context,index){
              return  SizedBox(height: 14.0,);
            }, itemCount: snapshot.data?.articles?.length ?? 0,
            ),
          );
      }
      else if(snapshot.hasError){
        return myErrorWidget();
      }
      return  Center();
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
   return FutureBuilder(future: ApiServices.
    getNews(query: query), builder: (context,snapshot){
      if(snapshot.connectionState==ConnectionState.waiting){
        return LoadingWidget();
      }else if(snapshot.hasData
          && snapshot.data?.articles != null){

        return

          Container(
            width: double.infinity,
            height:double.infinity,
            decoration: BoxDecoration(color: Colors.white,
                image: DecorationImage(image:
                AssetImage("assets/images/pattern.png"),
                    fit: BoxFit.fill)
            ),
          child: ListView.separated(

            itemBuilder: (context,index){
              final    articles=
                  snapshot.data!.articles!??[];
              return  InkWell(
                onTap: (){
                  Navigator.pushNamed(context,
                      NewsDetials.routeName,arguments: articles[index]);
                },
                child: NewsItem(
                  news: snapshot.data?.articles?[index] ??
                      Articles(),
                ),
              );
            }, separatorBuilder: (context,index){
            return  SizedBox(height: 14.0,);
          }, itemCount: snapshot.data?.articles?.length ?? 0,
          ),
        );
      }
      else if(snapshot.hasError){
        return myErrorWidget();
      }
      return  Center();
    });
  }
}
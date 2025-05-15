import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newshttp/news/data/models/news_model.dart';


import '../../../shared/app_theme.dart';

class NewsItem extends StatelessWidget {
  Articles news;
   NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
  ClipRRect(
      borderRadius: BorderRadius.circular(5),
    child:
    CachedNetworkImage(imageUrl:news.urlToImage
        ?? "https://png.pngtree.com/png-clipart/20230405/original/pngtree-breaking-news-png-image_9025694.png",
      width: double.infinity,
      height: 140,
      fit: BoxFit.cover,

    placeholder: (context,_)=>
        Center(
          child: CircularProgressIndicator(
            color: AppTheme.primary,
          ),
        ),
    errorWidget: (context,_,e)=>
        Center(child: Icon(Icons.image_not_supported,size:
        70,)),)


  ),
          SizedBox(height: 5.0,),
          Text(news.source!.name??"",style: Theme.of(context).textTheme.headlineSmall,)
          ,SizedBox(height: 8.0,),
          Text(news!.title??"",style: Theme.of(context).textTheme.bodyLarge,)
        ],
      ),
    );
  }
}

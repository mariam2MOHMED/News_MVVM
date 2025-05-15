import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newshttp/shared/app_theme.dart';
import 'package:newshttp/news/data/models/news_model.dart';

import 'package:url_launcher/url_launcher.dart';

class NewsDetials extends StatelessWidget {
  static String routeName="/NewsDetials";
   NewsDetials({super.key});

  @override
  Widget build(BuildContext context) {
    final arg=ModalRoute.of(context)!.settings!.arguments as
    Articles;
    return Container(
      width: double.infinity,
      height:double.infinity,
      decoration: BoxDecoration(color: Colors.white,
          image: DecorationImage(image:
          AssetImage("assets/images/pattern.png"),
              fit: BoxFit.fill)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
    appBar: AppBar(
    title: Text("News Tile"),),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.0),
                CachedNetworkImage(imageUrl:arg.urlToImage
                    ?? "https://png.pngtree.com/png-clipart/20230405/original/pngtree-breaking-news-png-image_9025694.png",
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,

                  placeholder: (context,_)=>
                      Center(
                        child: CircularProgressIndicator(
                          color: AppTheme.primary,
                        ),
                      ),
                  errorWidget: (context,_,e)=>
                      Center(child: Icon(Icons.image_not_supported,size:
                      70,)),),
                SizedBox(height: 20.0),
                Text(arg.source?.name ?? "", style: Theme.of(context).textTheme.headlineSmall),
                SizedBox(height: 8.0),
                Text(arg.title ?? "", style: Theme.of(context).textTheme.bodyLarge),
                SizedBox(height: 8.0),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Text(arg.publishedAt!.substring(0,10) ?? "",
                      style: TextStyle(color: Color(0xffA3A3A3), fontSize: 13.0)),
                ),
                SizedBox(height: 16.0),
                Text(arg.description ?? "",
                    style: TextStyle(color: Color(0xff42505C), fontSize: 13.0)),
                SizedBox(height: 49.0),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: AppTheme.primary, foregroundColor: Colors.white),
                    onPressed: () {
                      _launchUrl(arg!.url!);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("View Articles ",
     style: TextStyle(fontSize: 14,
 color: Colors.white)),
Icon(Icons.arrow_forward_ios,
     color: Colors.white, size: 18)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
  Future<void> _launchUrl(String url ) async {
    final _url=Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}

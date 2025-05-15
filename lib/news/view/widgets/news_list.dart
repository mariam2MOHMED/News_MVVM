import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:newshttp/api_managers/api_services.dart';
import 'package:newshttp/categoey/category_detials.dart';
import 'package:newshttp/news/view_model/cubit/news_view_model_cubit.dart';
import 'package:newshttp/shared/app_theme.dart';
import 'package:newshttp/news/data/models/news_model.dart';

import 'package:newshttp/news/view/widgets/news_detials.dart';
import 'package:newshttp/news/view/widgets/news_item.dart';

import 'package:newshttp/shared/widgets/error_widget.dart';
import 'package:newshttp/shared/widgets/loading_eidget.dart';

import 'package:provider/provider.dart';
// class NewsList extends StatefulWidget {
//   String sourceId;
//    NewsList({required this.sourceId});
//    @override
//   State<NewsList> createState() => _NewsListState();
// }
//
// class _NewsListState extends State<NewsList> {
//   ScrollController screoll=ScrollController();
//   bool lastPage=false;
//   int page=1;    List<Articles> articles=[];
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     screoll.addListener(() {
// if(screoll.position.atEdge&&screoll.position.pixels!=0 &&!lastPage){
// page++;
// setState(() {});
// }});
//     fetchNews();
//   }
//   @override
//   void didUpdateWidget(covariant NewsList oldWidget) {
//     // TODO: implement didUpdateWidget
//     super.didUpdateWidget(oldWidget);
//     if (widget.sourceId != oldWidget.sourceId) {
//       page = 1;
//       articles.clear();
//       lastPage = false;
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//   print("------------------------${page}");
//     return
//       FutureBuilder(future: ApiServices.
//     getNews(sourceId: widget.sourceId,
//           page: page
//       ), builder: (context,snapshot){
//       if(snapshot.connectionState==ConnectionState.waiting &&
//           articles.isEmpty){
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 50.0,),
//             LoadingAnimationWidget.threeArchedCircle(color: AppTheme.primary,
//                 size: 40)
//           ],
//         );
//       }
//
//    else   if((snapshot.data?.articles)!.isNotEmpty){
//     if(snapshot.data!.articles!.length<10){
//       lastPage=true;
//     }
//         articles.addAll(snapshot.data!.articles!);
//
//         return  Expanded(
//           child: ListView.separated(
//             controller: screoll,
//             itemBuilder: (context,index){
//               articles=
//                   snapshot.data!.articles!??[];
//               return  InkWell(
//                 onTap: (){
//                   Navigator.pushNamed(context,
//                       NewsDetials.routeName,arguments: articles[index]);
//                 },
//                 child: NewsItem(
//                   news: articles[index],
//                 ),
//               );
//             }, separatorBuilder: (context,index){
//             return  SizedBox(height: 14.0,);
//           }, itemCount: snapshot.data?.articles?.length ?? 0,
//           ),
//         );
//       }
//    else{
//      return myErrorWidget();
//       }
//
//     });
//
//
//   }
//   void fetchNews() async {
//     try {
//       final response = await ApiServices.getNews(
//         sourceId: widget.sourceId,
//         page: page,
//       );
//
//       // Update the state only if there are new articles
//       if (response.articles != null && response.articles!.isNotEmpty) {
//         setState(() {
//           if (response.articles!.length < 10) {
//             lastPage = true; // No more pages to load
//           }
//           articles.addAll(response.articles!); // Add new articles to the list
//         });
//       }
//     } catch (e) {
//       print("Error fetching news: $e");
//     }
//   }
// }
class NewsList extends StatefulWidget {
  final String sourceId;

  const NewsList({required this.sourceId, Key? key}) : super(key: key);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Fetch initial data for the current sourceId
    BlocProvider.of<NewsViewModelCubit>(context).
    fetchNews(sourceId: widget.sourceId);

    // Add scroll listener for pagination
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge &&
          _scrollController.position.pixels != 0 &&
          !BlocProvider.of<NewsViewModelCubit>(context).lastPage) {
        BlocProvider.of<NewsViewModelCubit>(context).page++;
        BlocProvider.of<NewsViewModelCubit>(context).fetchNews(sourceId: widget.sourceId);
      }
    });
  }

  @override
  void didUpdateWidget(covariant NewsList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.sourceId != oldWidget.sourceId) {
      // Reset cubit state and fetch new data when sourceId changes
      final cubit = BlocProvider.of<NewsViewModelCubit>(context);
      cubit.page = 1;
      cubit.news.clear();
      cubit.lastPage = false;
      cubit.fetchNews(sourceId: widget.sourceId);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsViewModelCubit, NewsViewModelState>(
      builder: (context, state) {
        if (state is NewsViewModelError) {
          return myErrorWidget();
        } else if (state is NewsViewModelSucess) {
          if (state.news.isEmpty) {
            return const Center(child: Text('No news available'));
          }
          return Expanded(
            child: ListView.separated(
              controller: _scrollController,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context,
        NewsDetials.routeName,arguments: state.news[index]);
                  },
                  child: NewsItem(news: state.news[index]),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 14.0),
              itemCount: state.news.length,
            ),
          );
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}

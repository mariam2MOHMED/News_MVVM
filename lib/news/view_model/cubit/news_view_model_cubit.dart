import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newshttp/news/data/models/news_model.dart';
import 'package:newshttp/news/data/repositry/news_repo.dart';
import 'package:newshttp/shared/services_locator.dart';

import '../../../api_managers/api_services.dart';

part 'news_view_model_state.dart';

// class NewsViewModelCubit extends Cubit<NewsViewModelState> {
//   NewsViewModelCubit() : super(NewsViewModelInitial()){
//     newsRepositry=NewsRepositry(newsDataSources:
//     ServicesLocator.newsDataSources);
//   }
//   late final NewsRepositry newsRepositry;
//   List<Articles>news=[];
//   Future<void> fetchNews({required String sourceId}) async {
//     try {
//       getNews(sourceId);
//       final newNews = await newsRepositry.getNews(sourceId);
//       if (newNews != null &&
//           newNews .isNotEmpty) {
//
//           if (newNews .length < 10) {
//             lastPage = true; // No more pages to load
//           }
//           news.addAll( newNews); // Add new articles to the list
//     emit(NewsViewModelFetchNews());
//       }
//     } catch (e) {
//       print("Error fetching news: $e");
//     }
//   }
//   Future<void>getNews(String sourceId)async{
//     emit(NewsViewModelLoading());
//     try{
//        news=await newsRepositry.getNews(sourceId);
//       emit(NewsViewModelSucess(news: news));
//     }catch(error){
//       emit(NewsViewModelError(error: error.toString()));
//     }
//   }
//   bool lastPage=false; int page = 1;
//   // Future<void> fetchNews({required String sourceId}) async {
//   //   try {
//   //     if (lastPage) return;
//   //
//   //     // Simulate fetching new data - in real case, pass page number or offset
//   //     final newNews = await newsRepositry.getNews(sourceId);
//   //
//   //     if (newNews.length < 10) {
//   //       lastPage = true;
//   //     }
//   //
//   //     news.addAll(newNews);
//   //     emit(NewsViewModelSucess(news: news));
//   //   } catch (e) {
//   //     print("Error fetching news: $e");
//   //     emit(NewsViewModelError(error: e.toString()));
//   //   }
//   // }
//
// }
class NewsViewModelCubit extends Cubit<NewsViewModelState> {
  List<Articles> news = [];
  int page = 1;
  bool lastPage = false;


  NewsViewModelCubit() : super(NewsViewModelInitial()){
    newsRepositry=NewsRepositry(newsDataSources:
    ServicesLocator.newsDataSources);
  }
  late final NewsRepositry newsRepositry;
  Future<void> fetchNews({required String sourceId}) async {
    emit(NewsViewModelLoading());
    try {
      final newsNews = await newsRepositry.
      getNews(sourceId);
      if (newsNews != null) {
        if (newsNews.length < 10) {
          lastPage = true;
        }
        news.addAll(newsNews!);
        emit(NewsViewModelSucess(news: news));
      } else {
        emit(NewsViewModelError(error: 'No articles found'));
      }
    } catch (e) {
      emit(NewsViewModelError(error: e.toString()));
    }
  }

  Future<void> getNews(String sourceId) async {
    page = 1;
    news.clear();
    lastPage = false;
    await fetchNews(sourceId: sourceId);
  }
}

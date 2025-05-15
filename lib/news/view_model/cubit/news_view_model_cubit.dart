import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newshttp/news/data/models/news_model.dart';
import 'package:newshttp/news/data/repositry/news_repo.dart';
import 'package:newshttp/shared/services_locator.dart';

part 'news_view_model_state.dart';

class NewsViewModelCubit extends Cubit<NewsViewModelState> {
  NewsViewModelCubit() : super(NewsViewModelInitial()){
    newsRepositry=NewsRepositry(newsDataSources:
    ServicesLocator.newsDataSources);
  }
  late final NewsRepositry newsRepositry;
  Future<void>getNews(String sourceId)async{
    emit(NewsViewModelLoading());
    try{
      final news=await newsRepositry.getNews(sourceId);
      emit(NewsViewModelSucess(news: news));
    }catch(error){
      emit(NewsViewModelError(error: error.toString()));
    }
  }
  // Future<void> fetchNews() async {
  //   try {
  //     getNews(sourceId);
  //
  //     if (viewModel.news != null &&
  //         viewModel.news .isNotEmpty) {
  //       setState(() {
  //         if (viewModel.news .length < 10) {
  //           lastPage = true; // No more pages to load
  //         }
  //         articles.addAll(viewModel.news ); // Add new articles to the list
  //       });
  //     }
  //   } catch (e) {
  //     print("Error fetching news: $e");
  //   }
  // }
}

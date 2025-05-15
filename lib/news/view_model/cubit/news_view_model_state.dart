part of 'news_view_model_cubit.dart';

abstract class NewsViewModelState {}

 class NewsViewModelInitial extends NewsViewModelState {}
class NewsViewModelLoading extends NewsViewModelState {}
class NewsViewModelSucess extends NewsViewModelState {
  final List<Articles>news;

  NewsViewModelSucess({required this.news});
}
class NewsViewModelError extends NewsViewModelState {
  final String error;

  NewsViewModelError({required this.error});
}
part of 'sources_view_model_cubit.dart';

abstract class SourcesViewModelState {}

 class SourcesViewModelInitial extends SourcesViewModelState {}
class SourcesViewModelLoading extends SourcesViewModelState {}
class SourcesViewModelSucess extends SourcesViewModelState {
  final List<Sources>sources;

  SourcesViewModelSucess({required this.sources});
}
class SourcesViewModelError extends SourcesViewModelState {
  final String error;

  SourcesViewModelError({required this.error});
}


import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newshttp/shared/services_locator.dart';
import '../../data/models/source_model.dart';
import '../../data/repos/sources_repo_api.dart';

part 'sources_view_model_state.dart';

class SourcesViewModelCubit extends Cubit<SourcesViewModelState> {
  late final SourcesRepositry sourcesRepositry;
  SourcesViewModelCubit() : super(SourcesViewModelInitial()){
    sourcesRepositry=SourcesRepositry(ServicesLocator.sourcesDataSource);
  }
  Future<void>getSources(String categoryId)async{
    emit(SourcesViewModelLoading());
    try{
      final sources=await sourcesRepositry.getSources(categoryId);
  emit(SourcesViewModelSucess(sources: sources)) ;
    }catch(e){
      emit(SourcesViewModelError(error: e.toString()));
    }
  }
}

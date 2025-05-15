import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newshttp/api_managers/api_services.dart';
import 'package:newshttp/news/view/widgets/news_item.dart';
import 'package:newshttp/news/view/widgets/news_list.dart';
import 'package:newshttp/source/view/source_item.dart';

import 'package:provider/provider.dart';

import '../models/category_model.dart';
import '../shared/widgets/loading_eidget.dart';
import '../source/view_model/sources_cubit/sources_view_model_cubit.dart';

class CategoryDetials extends StatefulWidget {
  final String id;
   CategoryDetials({required this.id});

  @override
  State<CategoryDetials> createState() => _CategoryDetialsState();
}

class _CategoryDetialsState extends State<CategoryDetials> {
  int selectTabIndex=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 
  }
  @override
  Widget build(BuildContext context) {

    return BlocProvider<SourcesViewModelCubit>
      (create: (context)=>SourcesViewModelCubit()..getSources(widget.id),
    child:BlocBuilder<SourcesViewModelCubit,SourcesViewModelState>(
      builder: (context,state){
      if(state is SourcesViewModelError){
          return ErrorWidget(state.error);
        }else if(state is SourcesViewModelSucess) {
          return  Column(
            children: [
              SizedBox(height: 12,),
              DefaultTabController(
                length: state.sources.length,
                child: TabBar(
                    indicatorColor:Colors.transparent ,
                    onTap: (index){
                      selectTabIndex=index;setState(() {

                      });
                    },
                    dividerColor: Colors.transparent,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    tabs: List.generate(state.sources.length, (index) =>
                        SourceItem(
                            isSelected: selectTabIndex==index,
                            txt: state.sources
                            [index].name!))),
              ),
              SizedBox(height: 12,),
              NewsList(
                sourceId: state.sources
                [selectTabIndex]!.id!,
              )
            ],
          );
        }else{
          return LoadingWidget();
        }
      },
    ) ,
    );




  }
}

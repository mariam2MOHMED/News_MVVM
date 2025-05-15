import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newshttp/shared/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeDrawer extends StatelessWidget {
  Function(MyDrawer drawer)onTap;
   HomeDrawer({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.65,
      child: Column(
        children: [
          Container(
            color: AppTheme.primary,
            width: double.infinity,
            height:MediaQuery.of(context).size.height*0.25,
child: Center(child: Text(AppLocalizations.of(context)!.newsapp,style: Theme.of(context).textTheme.titleLarge,)),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding:  EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [


                        IconButton(onPressed: (){
                          onTap(MyDrawer.Categories);
                        },
                            icon: Icon(
                            Icons.menu,color: Colors.black,
                        size: 25.0,
                        )),
                        SizedBox(width: 10,),
                        Text(AppLocalizations.of(context)!.categories,style: Theme.of(context).textTheme.
                        headlineLarge,),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [


                        IconButton(onPressed: (){
                          onTap(MyDrawer.settings);
                        },
                            icon: Icon(
                              Icons.settings,color: Colors.black,
                              size: 25.0,
                            )),
                        SizedBox(width: 10,),
                        Text(AppLocalizations.of(context)!.settings,
                          style: Theme.of(context).textTheme.
                        headlineLarge,),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
enum MyDrawer{
  Categories,settings;
}

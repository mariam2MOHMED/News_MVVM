import 'package:flutter/cupertino.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:newshttp/shared/app_theme.dart';

class   LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
       SizedBox(height:  MediaQuery.of(context).size.height*0.4,),
        Center(
          child: LoadingAnimationWidget.threeArchedCircle(
              color: AppTheme.primary, size: 50),
        ),
      ],
    );
  }
}

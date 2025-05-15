import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:newshttp/shared/app_theme.dart';

class   myErrorWidget extends StatelessWidget {
  const myErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text("Something went Wrong",style: TextStyle(
        color: AppTheme.primary,
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontSize: 28.0
      ),));
  }
}

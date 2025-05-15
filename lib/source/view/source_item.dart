import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newshttp/shared/app_theme.dart';

class SourceItem extends StatelessWidget {
  bool isSelected;String txt;
   SourceItem({
    required this.txt,this.isSelected=false
});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,horizontal: 18
      ),
      decoration: BoxDecoration(
        color: isSelected==true?AppTheme.primary:Colors.white,
        border: Border.all(
          color: AppTheme.primary,width: 2
        ),borderRadius: BorderRadius.circular(25.0)
      ),
      child: Text(txt,style: TextStyle(
        color: isSelected==true?Colors.white
            :AppTheme.primary,fontSize: 14.0,
        fontFamily: GoogleFonts.exo().fontFamily
      ),),
    );
  }
}

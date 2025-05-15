import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  static Color primary=Color(0xff39A552);
  static Color navy=Color(0xff4F5A69);
  static Color red=Color(0xffC91C22);
  static Color blue=Color(0xff003E90);
  static Color lightBlue=Color(0xff4882CF);
  static Color pink=Color(0xffED1E79);
  static Color white=Color(0xffffffff);
  static Color yellow=Color(0xffF2D352);
  static Color brown=Color(0xffCF7E48);
  static ThemeData lightTheme=ThemeData(
    textTheme: TextTheme(
      headlineSmall:TextStyle(
          color: navy,fontSize: 10,
          fontFamily: GoogleFonts.poppins().
          fontFamily,fontWeight:FontWeight.w400
      ),
   bodyMedium: TextStyle(
       color: navy,fontSize: 10,
       fontFamily: GoogleFonts.poppins().
       fontFamily,fontWeight:FontWeight.w400
   ),
      headlineLarge: TextStyle(
          color: Color(0xff42505C),fontSize: 25,
          fontFamily: GoogleFonts.poppins().
          fontFamily,fontWeight:FontWeight.w500
      ),
      titleLarge:TextStyle(
          color: Colors.white,fontSize: 28,
          fontFamily: GoogleFonts.exo().fontFamily
          ,fontWeight:FontWeight.bold
      ),
      headlineMedium: TextStyle(
        color: Colors.white,fontSize: 22,
          fontFamily: GoogleFonts.exo().fontFamily,fontWeight:FontWeight.w400
      ),
      titleMedium: TextStyle(
          color: navy,fontSize: 22,
          fontFamily: GoogleFonts.exo().
          fontFamily,fontWeight:FontWeight.w700
      ),
    ),
    appBarTheme: AppBarTheme(

      backgroundColor: primary,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(24)
,bottomLeft:    Radius.circular(24)
        )
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w400,
        fontFamily: GoogleFonts.exo().fontFamily
      ),
      foregroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.white,size: 22
      )
    )
  );
}
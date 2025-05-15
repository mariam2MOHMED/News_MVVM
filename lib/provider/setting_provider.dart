import 'package:flutter/cupertino.dart';

class SettingProvider with ChangeNotifier{
  String language='en';
  Future<void> changeLang(String lang)async{
  language=lang;
  notifyListeners();
}
}
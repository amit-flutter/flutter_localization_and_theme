import 'package:flutter/cupertino.dart';

class LocalProvider extends ChangeNotifier {
  bool setlan = false;
  String changetolanguage = "Arabic";
  Locale _locale = Locale('en');

  Locale get locale => _locale;

  void setLocale() {
    setlan = !setlan;
    changetolanguage = setlan ? "English" : "Arabic";
    _locale = setlan ? Locale('ar') : Locale('en');
    print(_locale);
    notifyListeners();
  }

  bool isDark = false;
  void changetheme() {
    isDark = !isDark;
    print(isDark);
    notifyListeners();
  }
}

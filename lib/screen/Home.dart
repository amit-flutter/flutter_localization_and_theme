import 'package:flutter/material.dart';
import 'package:localization/provider/locale_lang_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Localization"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LanguageWidget(),
            SizedBox(height: 12),
            Text(
              AppLocalizations.of(context)!.language,
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(height: 10),
            Text(
              AppLocalizations.of(context)!.helloworld,
              style: TextStyle(fontSize: 40, color: Colors.red),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            MaterialButton(
              onPressed: () {
                Provider.of<LocalProvider>(context, listen: false).setLocale();
              },
              child: Text(
                "Change Language to ${Provider.of<LocalProvider>(context).changetolanguage}",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              color: Colors.blueAccent,
              padding: EdgeInsets.all(20),
            ),
            SizedBox(height: 20),
            MaterialButton(
              onPressed: () {
                Provider.of<LocalProvider>(context, listen: false)
                    .changetheme();
              },
              child: Text(
                "Change to ${Provider.of<LocalProvider>(context).isDark ? "Light" : "Dark"}",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              color: Colors.blueAccent,
              padding: EdgeInsets.all(20),
            )
          ],
        ),
      ),
    );
  }
}



class LanguageWidget extends StatelessWidget {
  const LanguageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final flag = locale.languageCode;
    return Center(
      child: Text(
        "Current Language Code = " + flag,
        style: TextStyle(fontSize: 26),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/pages/HomePage.dart';
import 'package:news_app/provider/HeadlineProvider.dart';
import 'package:news_app/provider/ExploreProvider.dart';
import 'package:news_app/provider/ThemeProvider.dart';
import 'package:news_app/utils.dart';
import 'package:news_app/cache/PreferencesRepo.dart' as preferences;
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
              value: HeadlineProvider()),
          ChangeNotifierProvider.value(
              value: ExploreProvider()),
          ChangeNotifierProvider.value(
              value: ThemeProvider()),
        ],
        child: OnBoardingAppContainer(),
      )
    );

class OnBoardingAppContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var themeProvider = Provider.of<ThemeProvider>(context);
    print('From main: ${themeProvider.theme}');

    preferences.getCurrentTheme().then((string){
      if(string == Utils.LIGHT_THEME_STRING()){
//        themeProvider.theme =
      }
    });

    return MaterialApp(
      title: "NewsApp!",
      debugShowCheckedModeBanner: false,
      theme: themeProvider.theme == null ? Utils.getLightTheme() : themeProvider.theme,
      debugShowMaterialGrid: false,
      home: HomePage(),
    );
  }
}


class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Utils.getPrimaryColor(),
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 200,
          ),
          Image.asset("assets/images/trends_trans.png", height: 200, width: 400,),
          SizedBox(height: 20,),
          Text("With the biggest news source in he world, We're bring everything you could ever need to know to your fingertips!", style:
            TextStyle(
              fontFamily: Utils.getFontName(), fontSize: 17, color: Colors.white
            ),
          ),
          SizedBox(height: 100,),
          RaisedButton(onPressed: (){

          }, elevation: 10.0, color: Colors.white, child: Text("Leggo!", style: TextStyle(
                fontFamily: Utils.getFontName(), color: Utils.getPrimaryColor(),
              ),
            ),
          )
        ],

      ),
    );
  }
}

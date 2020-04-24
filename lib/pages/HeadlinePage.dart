import 'package:flutter/material.dart';
import 'package:news_app/provider/HeadlineProvider.dart';
import 'package:news_app/utils.dart';
import 'package:news_app/views/CategoryView.dart';
import 'package:news_app/views/HeadlineView.dart';
import 'package:provider/provider.dart';

class HeadlinePage extends StatefulWidget {
  @override
  _HeadlinePageState createState() => _HeadlinePageState();
}

class _HeadlinePageState extends State<HeadlinePage> {
  var provider;
  var categoryList = Utils.getCategoryList();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<HeadlineProvider>(context);
    provider.getHeadlines();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Headlines!", style: new TextStyle(
            fontSize: 30.0, fontFamily: Utils.getBoldFont(), color: Colors.green /* #10db5d */
          ),
        ),
        elevation: 0,
        actions: <Widget>[
          Icon(Icons.search, color: Colors.black, size: 27,)
        ],
      ),
      body: Container(
        padding: EdgeInsets.only( right: 10, left: 10),
        color: Colors.white,
        child: loadAccordingToProviderState(provider),
      ),
    );
  }

  Widget loadAccordingToProviderState(HeadlineProvider provider){
    print(provider.isLoading());
    if (provider.isLoading()){
      return Flex(
        direction: Axis.vertical,
        children: <Widget>[
        Expanded(child: Center(child: CircularProgressIndicator()))
      ], );
    }else{
      if(provider.getHeadline() != null){
        return ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, position) => HeadlineView(provider.getHeadline().articles[position]),
            itemCount: provider.getHeadline().articles.length);
      }else{
        return Expanded(
          child: Center(
            child: Column(
              children: <Widget>[
                Icon(Icons.error_outline, size: 100,  color: Colors.green,),
                SizedBox(height: 10,),
                Row(
                  children: <Widget>[
                    Text("Check your internet connection and ", style: TextStyle(
                        fontFamily: Utils.getFontName(), fontSize: 17, color: Colors.black
                    ),
                    ),
                    SizedBox(width: 5,),
                  ],
                )
              ],
            ),
          ),
        );
      }

    }
  }
}

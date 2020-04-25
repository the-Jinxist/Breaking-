import 'package:flutter/material.dart';
import 'package:news_app/model/HeadlineModel.dart';
import 'package:news_app/utils.dart';

class HeadlineView extends StatelessWidget {

  final Article headlineArticle;
  List<BoxFit> values = [BoxFit.fitWidth, BoxFit.fitHeight];

  HeadlineView(this.headlineArticle);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(7),
      child: Container(
        height: 320,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50))
        ),
        child: Column(
          children: <Widget>[
            FadeInImage.assetNetwork(placeholder: "assets/images/news_image_paceholder.png", image: headlineArticle.urlToImage != null ? headlineArticle.urlToImage: "", fit: BoxFit.cover, height: 200, width: double.maxFinite,),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(headlineArticle.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: Utils.getBoldFont(), fontSize: 20, color: Colors.black),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(headlineArticle.description, maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: Utils.getFontName(), fontSize: 12, color: Colors.black),),
            ),
            SizedBox(height: 3,),
            Expanded(child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text(headlineArticle.source.name, style: TextStyle(fontFamily: Utils.getBoldFont(), fontSize: 10, color: Colors.green)),
                ),
              ],
            )
            )

          ],
        ),
      ),
    );
  }
}

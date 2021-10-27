import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:stokarat/models/feed.dart';
import 'package:url_launcher/url_launcher.dart';

class FullItemPage extends StatelessWidget {
  Feed feedItem;
  int index;

  FullItemPage({required this.feedItem, required this.index});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text(
              '${feedItem.title} ${DateTime.parse(feedItem.date).year.toString()}')),
      body: Container(
        child: ListView(
          children: [
            Hero(
                tag: 'tag_$index',
                child: Material(
                  child: Image.network(
                    feedItem.thumbnail,
                    fit: BoxFit.cover,
                    height: 230,
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () async => {
                            await canLaunch(feedItem.side1.url)
                                ? await launch(feedItem.side1.url)
                                : throw 'Could not launch ${feedItem.side1.url}'
                          },
                      child: Text(feedItem.side1.name)),
                  flex: 3,
                ),
                Flexible(
                  child: Text("VS"),
                  flex: 1,
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () async => {
                            await canLaunch(feedItem.side2.url)
                                ? await launch(feedItem.side2.url)
                                : throw 'Could not launch ${feedItem.side2.url}'
                          },
                      child: Text(feedItem.side2.name)),
                  flex: 3,
                )
              ],
            ),
            Column(
              children: [
                Text(
                  "Highlights",
                  style: TextStyle(fontSize: 24),
                ),
                GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                    ),
                    itemCount: feedItem.videos.length,
                    itemBuilder: (BuildContext context, index) {
                      return ExpansionTile(
                        title: Text("${feedItem.videos[index]["title"]}"),
                        children: [
                          // Text(feedItem.videos[index]["embed"]),
                          SizedBox(
                            width: 400,
                            height: 400,
                            child: InAppWebView(
                              initialData: InAppWebViewInitialData(
                                  data: feedItem.videos[index]["embed"]),
                            ),
                          )
                        ],
                      );
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stokarat/cubit/feed_cubit.dart';
import 'package:stokarat/models/feed.dart';

import 'full_item_page.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:  CircleAvatar(
            backgroundImage: AssetImage('assets/play.png'),
          ),
        ),
        body: BlocBuilder<FeedCubit, FeedState>(
          builder: (BuildContext context, state) {
            if (state is InitialState) {
              BlocProvider.of<FeedCubit>(context).loadFeed();
              return Container(
                child: LinearProgressIndicator(),
              );
            }
            if (state is LoadedState) {
              return Container(
                child: ListView.builder(
                  itemCount: state.feed.length,
                  itemBuilder: (BuildContext context, int index) {
                    return feedCard(state.feed[index], context, index);
                  },
                ),
              );
            }
            return Container();
          },
        ));
  }

  Widget feedCard(Feed feedItem, context, index) {
    return Card(
      child: InkWell(
        onTap: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      FullItemPage(feedItem: feedItem, index: index)))
        },
        child: Hero(
          tag: 'tag_$index',
          child: Material(
            child: Ink(
                height: 200,
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.blue.withOpacity(0.5),
                      Colors.red.withOpacity(0.5),
                    ],
                  )),
                  child: Stack(
                    children: [
                      Image.network(
                        feedItem.thumbnail,
                        errorBuilder:
                            (BuildContext context, error, stacktrace) {
                          return Text("NoImage");
                        },
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.blue.withOpacity(0.5),
                          Colors.red.withOpacity(0.5),
                        ],
                      ))),
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/play.png'),
                        ),
                      ),
                      Positioned(
                        child: Text(
                          feedItem.title,
                          style: TextStyle(
                            color: Colors.white,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 8.0,
                                color: Color.fromARGB(0, 0, 0, 255),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}

import 'package:stokarat/models/side.dart';
import 'package:stokarat/models/videos.dart';

class Feed {
  String title;
  String embed;
  String url;
  String thumbnail;
  String date;
  Side side1;
  Side side2;
  Map competition;
  List<dynamic> videos;

  Feed(
      {required this.title,
      required this.embed,
      required this.url,
      required this.thumbnail,
      required this.date,
      required this.side1,
      required this.side2,
      required this.competition,
      required this.videos});

  factory Feed.fromJson(Map<String, dynamic> json) {
    return Feed(
        title: json["title"],
        embed: json["embed"],
        url: json["url"],
        thumbnail: json["thumbnail"],
        date: json["date"],
        side1: Side.fromJson(json["side1"]),
        side2: Side.fromJson(json["side2"]),
        competition: json["competition"],
        videos: json["videos"]);
  }
}

import 'package:stokarat/models/feed.dart';
import 'package:stokarat/repositories/feed/feed_provider.dart';

class FeedRepository {
  FeedProvider feedProvider = FeedProvider();
  Future<List<Feed>> getFeed() => feedProvider.getFeed();
}
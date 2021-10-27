import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stokarat/models/feed.dart';
import 'package:stokarat/repositories/feed/feed_repository.dart';

class FeedCubit extends Cubit<FeedState> {
  FeedRepository feedRepository;

  FeedCubit(this.feedRepository) : super(InitialState());

  Future<void> loadFeed() async {
    List<Feed> feed = await feedRepository.getFeed();
    emit(LoadedState(feed: feed));
  }
}

abstract class FeedState {}

class InitialState extends FeedState {}

class LoadedState extends FeedState {
  List<Feed> feed;

  LoadedState({required this.feed});
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stokarat/cubit/feed_cubit.dart';
import 'package:stokarat/repositories/feed/feed_repository.dart';
import 'package:stokarat/ui/screens/feed_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); //all widgets are rendered here
  final FeedRepository feedRepository = FeedRepository();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<FeedCubit>(create: (context) => FeedCubit(feedRepository)),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: FeedPage(),
    );
  }
}

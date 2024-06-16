import 'package:basic_flashcards/repositories/collections/collections_repo.dart';
import 'package:basic_flashcards/types/data/collection.dart';
import 'package:basic_flashcards/utils/file_picker.dart';
import 'package:basic_flashcards/view/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_bloc.dart';
part 'app_event.dart';
part 'app_state.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Flashcards',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AppBloc(),
          ),
        ],
        child: const Home(),
      ),
    );
  }
}

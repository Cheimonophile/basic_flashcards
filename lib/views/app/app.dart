import 'package:basic_flashcards/blocs/data/collections/collections_bloc.dart';
import 'package:basic_flashcards/views/screens/collections/collections_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            create: (_) => CollectionsBloc(),
          ),
        ],
        child: const CollectionsScreen(),
      ),
    );
  }
}
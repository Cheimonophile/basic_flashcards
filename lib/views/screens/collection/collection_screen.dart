import 'package:basic_flashcards/blocs/data/decks/decks_bloc.dart';
import 'package:basic_flashcards/types/data/collection.dart';
import 'package:basic_flashcards/types/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollectionScreen extends Screen {
  final Collection collection;

  const CollectionScreen(this.collection, {super.key});

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Collection ${collection.fileName}"),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<DecksBloc>(
            create: (context) => DecksBloc(collection),
          ),
        ],
        child: const Center(
          child: Text("Collection Screen"),
        ),
      ),
    );
  }
}

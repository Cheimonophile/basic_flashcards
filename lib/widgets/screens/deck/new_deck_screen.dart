import 'package:basic_flashcards/blocs/data/decks/decks_bloc.dart';
import 'package:basic_flashcards/interfaces/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

/// screen for creating a new deck
class NewDeckScreen extends Screen {
  /// The decks bloc required for creating a new deck
  final DecksBloc decksBloc;

  const NewDeckScreen({super.key, required this.decksBloc});

  /// when the create deck button is pressed
  _onPressedCreateDeck(BuildContext context) {
    final deckName = const Uuid().v4();
    BlocProvider.of<DecksBloc>(context).add(DecksCreate(
      name: deckName,
    ));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: decksBloc),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("New Deck"),
          ),
          body: Center(
            child: ElevatedButton(
              onPressed: () => _onPressedCreateDeck(context),
              child: const Text("Create Deck"),
            ),
          ),
        );
      }),
    );
  }
}

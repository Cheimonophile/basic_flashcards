import 'package:basic_flashcards/blocs/data/decks/decks_bloc.dart';
import 'package:basic_flashcards/interfaces/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// screen for creating a new deck
class NewDeckScreen extends Screen {
  /// The decks bloc required for creating a new deck
  final DecksBloc decksBloc;

  /// text editing controller for the name of the deck
  final TextEditingController nameController = TextEditingController();

  /// constructs a new deck screen
  ///
  /// [decksBloc] is required for creating a new deck
  NewDeckScreen({super.key, required this.decksBloc});

  /// when the create deck button is pressed
  _onPressedCreateDeck(BuildContext context) {
    final name = nameController.text;
    BlocProvider.of<DecksBloc>(context).add(DecksCreate(
      name: name,
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
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name of the deck
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Name",
                  ),
                ),
                const SizedBox(height: 8),

                // create button
                ElevatedButton(
                  onPressed: () => _onPressedCreateDeck(context),
                  child: const Text("Create Deck"),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

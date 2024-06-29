import 'package:basic_flashcards/blocs/data/decks/decks_bloc.dart';
import 'package:basic_flashcards/models/collection.dart';
import 'package:basic_flashcards/interfaces/widgets/screen.dart';
import 'package:basic_flashcards/models/deck.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class CollectionScreen extends Screen {
  final Collection collection;

  const CollectionScreen(this.collection, {super.key});

  /// when the add deck button is pressed
  _onPressedAddDeck(BuildContext context) async {
    final deckName = const Uuid().v4();
    context.read<DecksBloc>().add(DecksCreate(name: deckName));
  }

  /// when the delete deck button is pressed
  _onPressedDeleteDeck(BuildContext context, Deck deck) async {
    final decksBloc = context.read<DecksBloc>();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("Delete Collection"),
        content: Text("Are you sure you want to delete deck '${deck.name}'?"),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text("Delete"),
            onPressed: () {
              Navigator.of(context).pop(true);
              decksBloc.add(DecksDelete(deck));
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DecksBloc>(
          create: (context) => DecksBloc(collection),
        ),
      ],
      child: BlocBuilder<DecksBloc, DecksState>(
        builder: (context, decksState) => Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text("Collection ${collection.fileName}"),
          ),
          body: Builder(
            builder: (context) {
              if (decksState is DecksLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (decksState is DecksLoaded) {
                return ListView.builder(
                  itemCount: decksState.decks.length,
                  itemBuilder: (context, index) {
                    final deck = decksState.decks[index];
                    return ListTile(
                      title: Text(deck.name),
                      onTap: () => print(deck),
                      // delete button
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _onPressedDeleteDeck(context, deck),
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: Text("TBD"));
              }
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _onPressedAddDeck(context),
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

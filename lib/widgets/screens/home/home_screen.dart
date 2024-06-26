import 'package:basic_flashcards/blocs/data/collections/collections_bloc.dart';
import 'package:basic_flashcards/models/collection.dart';
import 'package:basic_flashcards/interfaces/widgets/screen.dart';
import 'package:basic_flashcards/utils/file_picker.dart';
import 'package:basic_flashcards/widgets/screens/collection/collection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends Screen {
  const HomeScreen({super.key});

  /// when the new collection button is pressed
  _onPressedNewCollection(BuildContext context) async {
    String? newCollectionPath = await newCollection();
    if (newCollectionPath == null) return;
    if (!context.mounted) return;
    BlocProvider.of<CollectionsBloc>(context)
        .add(NewCollectionsEvent(newCollectionPath));
  }

  /// when the open collection button is pressed
  _onPressedOpenCollection(BuildContext context) async {
    String? collectionPath = await openCollection();
    if (collectionPath == null) return;
    if (!context.mounted) return;
    BlocProvider.of<CollectionsBloc>(context)
        .add(OpenCollectionsEvent(collectionPath));
  }

  /// when the delete collection button is pressed
  _onPressedDeleteCollection(BuildContext context, Collection collection) {
    final collectionsBlock = BlocProvider.of<CollectionsBloc>(context);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("Delete Collection"),
        content:
            Text("Are you sure you want to delete ${collection.fileName}?"),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text("Delete"),
            onPressed: () {
              Navigator.of(context).pop();
              collectionsBlock.add(DeleteCollectionsEvent(collection));
            },
          ),
        ],
      ),
    );
  }

  /// navigate to the collection screen
  _navigateToCollectionScreen(BuildContext context, Collection collection) {
    Navigator.of(context).push(CollectionScreen(collection).route);
    BlocProvider.of<CollectionsBloc>(context)
        .add(OpenCollectionsEvent(collection.path));
  }

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Collections"),
      ),
      body: BlocBuilder<CollectionsBloc, CollectionsState>(
          builder: (context, state) {
        // If the app is loading, show a loading indicator
        if (state is LoadingCollectionsState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // if the app is in loaded state
        if (state is LoadedCollectionsState) {
          return Expanded(
            child: ListView(
              children: state.collections
                  .map((collection) => ListTile(
                        onTap: () =>
                            _navigateToCollectionScreen(context, collection),
                        title: Text(collection.fileName),
                        subtitle: Text(collection.path),
                        trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _onPressedDeleteCollection(
                                context, collection)),
                      ))
                  .toList(),
            ),
          );
        }
        // unreachable state
        return const Center();
      }),
      persistentFooterAlignment: AlignmentDirectional.topStart,
      persistentFooterButtons: [
        // button to add a new collection
        FilledButton.tonalIcon(
          onPressed: () => _onPressedNewCollection(context),
          icon: const Icon(Icons.add),
          label: const Text("New Collection"),
        ),

        // button to open a collection
        FilledButton.tonalIcon(
          onPressed: () => _onPressedOpenCollection(context),
          icon: const Icon(Icons.open_in_browser),
          label: const Text("Open Collection"),
        ),
      ],
    );
  }
}

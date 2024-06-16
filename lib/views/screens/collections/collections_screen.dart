import 'package:basic_flashcards/blocs/data/collections/collections_bloc.dart';
import 'package:basic_flashcards/types/data/collection.dart';
import 'package:basic_flashcards/types/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollectionsScreen extends Screen {
  const CollectionsScreen({super.key});

  /// when the new collection button is pressed
  _onPressedNewCollection(BuildContext context) {
    BlocProvider.of<CollectionsBloc>(context).add(CollectionsNewCollectionEvent());
  }

  /// when the open collection button is pressed
  _onPressedOpenCollection(BuildContext context) {
    BlocProvider.of<CollectionsBloc>(context).add(CollectionsOpenCollectionEvent());
  }

  /// when the delete collection button is pressed
  _onPressedDeleteCollection(BuildContext context, Collection collection) {
    BlocProvider.of<CollectionsBloc>(context).add(CollectionsDeleteCollectionEvent(collection));
  }

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home Page"),
      ),
      body: BlocBuilder<CollectionsBloc, CollectionsState>(builder: (context, state) {
        // If the app is loading, show a loading indicator
        if (state is CollectionsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // if the app is in an error state, show an error message
        if (state is CollectionsErrorState) {
          return const Center(
            child: Text("An error occurred"),
          );
        }

        // if the app is in loaded state
        if (state is CollectionsLoadedState) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
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
                  ]
                      .map((widget) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: widget,
                          ))
                      .toList(),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListView(
                      children: state.collections
                          .map((collection) => ListTile(
                                onTap: () {},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                title: Text(collection.fileName),
                                subtitle: Text(collection.filePath),
                                trailing: IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () => _onPressedDeleteCollection(
                                        context, collection)),
                              ))
                          .toList(),
                    ),
                  ),
                )
              ],
            ),
          );
        }
        // unreachable state
        return const Center();
      }),
    );
  }
}

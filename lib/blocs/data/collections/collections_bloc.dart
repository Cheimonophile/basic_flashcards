import 'package:basic_flashcards/repos/collections/collections_repo.dart';
import 'package:basic_flashcards/types/data/collection.dart';
import 'package:basic_flashcards/utils/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'collections_event.dart';
part 'collections_state.dart';

class CollectionsBloc extends Bloc<CollectionsEvent, CollectionsState> {
  final CollectionsRepo collectionsRepo = CollectionsRepo();

  CollectionsBloc() : super(CollectionsState.loading()) {
    on<CollectionsLoadEvent>(_onCollectionsLoadEvent);
    on<CollectionsNewCollectionEvent>(_onCollectionsNewCollectionEvent);
    on<CollectionsOpenCollectionEvent>(_onCollectionsOpenCollectionEvent);
    on<CollectionsDeleteCollectionEvent>(_onCollectionsDeleteCollectionEvent);

    // load the app event
    add(CollectionsLoadEvent());
  }

  /// Event handler for load event
  void _onCollectionsLoadEvent(CollectionsLoadEvent event, Emitter<CollectionsState> emit) async {
    final List<Collection> collections =
        await collectionsRepo.reads();
    emit(CollectionsState.withCollections(collections));
  }

  /// Event handler for add collection event
  void _onCollectionsNewCollectionEvent(
      CollectionsNewCollectionEvent event, Emitter<CollectionsState> emit) async {
    String? newCollectionPath = await newCollection();
    if (newCollectionPath == null) {
      return;
    }
    await collectionsRepo.create(newCollectionPath);
    final List<Collection> collections =
        await collectionsRepo.reads();
    emit(CollectionsState.withCollections(collections));
  }

  /// Event handler for open collection event
  void _onCollectionsOpenCollectionEvent(
      CollectionsOpenCollectionEvent event, Emitter<CollectionsState> emit) async {
    String? collectionPath = await openCollection();
    if (collectionPath == null) {
      return;
    }
    await collectionsRepo.read(collectionPath);
    final List<Collection> collections =
        await collectionsRepo.reads();
    emit(CollectionsState.withCollections(collections));
  }

  /// Event handler for delete collection event
  void _onCollectionsDeleteCollectionEvent(
      CollectionsDeleteCollectionEvent event, Emitter<CollectionsState> emit) async {
    await collectionsRepo.delete(event.collection);
    final List<Collection> collections =
        await collectionsRepo.reads();
    emit(CollectionsState.withCollections(collections));
  }
}

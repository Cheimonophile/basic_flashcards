import 'package:basic_flashcards/repos/collections/collections_repo.dart';
import 'package:basic_flashcards/types/data/collection.dart';
import 'package:basic_flashcards/utils/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'collections_event.dart';
part 'collections_state.dart';

class CollectionsBloc extends Bloc<CollectionsEvent, CollectionsState> {
  final CollectionsRepo collectionsRepo = CollectionsRepo();

  CollectionsBloc() : super(CollectionsState.loading()) {
    on<LoadCollectionsEvent>(_onCollectionsLoadEvent);
    on<NewCollectionsEvent>(_onCollectionsNewCollectionEvent);
    on<OpenCollectionsEvent>(_onCollectionsOpenCollectionEvent);
    on<DeleteCollectionsEvent>(_onCollectionsDeleteCollectionEvent);

    // load the app event
    add(LoadCollectionsEvent());
  }

  /// Event handler for load event
  void _onCollectionsLoadEvent(
      LoadCollectionsEvent event, Emitter<CollectionsState> emit) async {
    final List<Collection> collections = await collectionsRepo.reads();
    emit(CollectionsState.withCollections(collections));
  }

  /// Event handler for add collection event
  void _onCollectionsNewCollectionEvent(
      NewCollectionsEvent event, Emitter<CollectionsState> emit) async {
    String? newCollectionPath = await newCollection();
    if (newCollectionPath == null) {
      return;
    }
    await collectionsRepo.create(newCollectionPath);
    final List<Collection> collections = await collectionsRepo.reads();
    emit(CollectionsState.withCollections(collections));
  }

  /// Event handler for open collection event
  void _onCollectionsOpenCollectionEvent(
      OpenCollectionsEvent event, Emitter<CollectionsState> emit) async {
    String? collectionPath = await openCollection();
    if (collectionPath == null) {
      return;
    }
    await collectionsRepo.read(collectionPath);
    final List<Collection> collections = await collectionsRepo.reads();
    emit(CollectionsState.withCollections(collections));
  }

  /// Event handler for delete collection event
  void _onCollectionsDeleteCollectionEvent(
      DeleteCollectionsEvent event, Emitter<CollectionsState> emit) async {
    await collectionsRepo.delete(event.collection);
    final List<Collection> collections = await collectionsRepo.reads();
    emit(CollectionsState.withCollections(collections));
  }
}

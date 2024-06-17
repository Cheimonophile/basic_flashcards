import 'package:basic_flashcards/repos/collections/collections_repo.dart';
import 'package:basic_flashcards/types/data/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'collections_event.dart';
part 'collections_state.dart';

class CollectionsBloc extends Bloc<CollectionsEvent, CollectionsState> {
  final CollectionsRepo collectionsRepo = CollectionsRepo();

  CollectionsBloc() : super(CollectionsState.loading()) {
    on<LoadCollectionsEvent>(_onLoadCollectionsEvent);
    on<NewCollectionsEvent>(_onNewCollectionsEvent);
    on<OpenCollectionsEvent>(_onOpenCollectionsEvent);
    on<DeleteCollectionsEvent>(_onDeleteCollectionsEvent);

    // load the app event
    add(LoadCollectionsEvent());
  }

  /// Event handler for load event
  void _onLoadCollectionsEvent(
      LoadCollectionsEvent event, Emitter<CollectionsState> emit) async {
    final List<Collection> collections = await collectionsRepo.reads();
    emit(CollectionsState.withCollections(collections));
  }

  /// Event handler for add collection event
  void _onNewCollectionsEvent(
      NewCollectionsEvent event, Emitter<CollectionsState> emit) async {
    await collectionsRepo.create(event.collectionPath);
    final List<Collection> collections = await collectionsRepo.reads();
    emit(CollectionsState.withCollections(collections));
  }

  /// Event handler for open collection event
  void _onOpenCollectionsEvent(
      OpenCollectionsEvent event, Emitter<CollectionsState> emit) async {
    await collectionsRepo.read(event.collectionPath);
    final List<Collection> collections = await collectionsRepo.reads();
    emit(CollectionsState.withCollections(collections));
  }

  /// Event handler for delete collection event
  void _onDeleteCollectionsEvent(
      DeleteCollectionsEvent event, Emitter<CollectionsState> emit) async {
    await collectionsRepo.delete(event.collection);
    final List<Collection> collections = await collectionsRepo.reads();
    emit(CollectionsState.withCollections(collections));
  }
}

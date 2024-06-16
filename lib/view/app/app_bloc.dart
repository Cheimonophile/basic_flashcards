part of 'app.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final CollectionsRepo collectionsRepo = CollectionsRepo();

  AppBloc() : super(AppState.loading()) {
    on<AppLoadEvent>(_onAppLoadEvent);
    on<AppNewCollectionEvent>(_onAppNewCollectionEvent);
    on<AppOpenCollectionEvent>(_onAppOpenCollectionEvent);

    // load the app event
    add(AppLoadEvent());
  }

  /// Event handler for load event
  void _onAppLoadEvent(AppLoadEvent event, Emitter<AppState> emit) async {
    final List<Collection> collections =
        await collectionsRepo.readCollections();
    emit(AppState.withCollections(collections));
  }

  /// Event handler for add collection event
  void _onAppNewCollectionEvent(
      AppNewCollectionEvent event, Emitter<AppState> emit) async {
    String? newCollectionPath = await newCollection();
    if (newCollectionPath == null) {
      return;
    }
    await collectionsRepo.createCollection(newCollectionPath);
    final List<Collection> collections =
        await collectionsRepo.readCollections();
    emit(AppState.withCollections(collections));
  }

  /// Event handler for open collection event
  void _onAppOpenCollectionEvent(
      AppOpenCollectionEvent event, Emitter<AppState> emit) async {
    String? collectionPath = await openCollection();
    if (collectionPath == null) {
      return;
    }
    await collectionsRepo.readCollection(collectionPath);
    final List<Collection> collections =
        await collectionsRepo.readCollections();
    emit(AppState.withCollections(collections));
  }
}

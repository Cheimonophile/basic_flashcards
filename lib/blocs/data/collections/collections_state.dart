part of 'collections_bloc.dart';

sealed class CollectionsState {
  static CollectionsState loading() => CollectionsLoadingState._();

  static CollectionsState error() => CollectionsErrorState._();

  static CollectionsState withCollections(List<Collection> collections) =>
      CollectionsLoadedState._(collections: collections);

  bool get isLoading => this is CollectionsLoadingState;
}

final class CollectionsLoadingState extends CollectionsState {
  CollectionsLoadingState._() : super();
}

final class CollectionsErrorState extends CollectionsState {
  CollectionsErrorState._() : super();
}

final class CollectionsLoadedState extends CollectionsState {
  CollectionsLoadedState._({required this.collections}) : super();

  final List<Collection> collections;
}

part of 'collections_bloc.dart';

sealed class CollectionsState {
  static CollectionsState loading() => LoadingCollectionsState._();

  static CollectionsState withCollections(List<Collection> collections) =>
      LoadedCollectionsState._(collections: collections);

  bool get isLoading => this is LoadingCollectionsState;
}

final class LoadingCollectionsState extends CollectionsState {
  LoadingCollectionsState._() : super();
}

final class LoadedCollectionsState extends CollectionsState {
  LoadedCollectionsState._({required this.collections}) : super();

  final List<Collection> collections;
}

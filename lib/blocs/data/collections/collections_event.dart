part of 'collections_bloc.dart';

sealed class CollectionsEvent {}

/// event for first loading the class
final class CollectionsLoadEvent extends CollectionsEvent {}

final class CollectionsNewCollectionEvent extends CollectionsEvent {}

final class CollectionsOpenCollectionEvent extends CollectionsEvent {}

final class CollectionsDeleteCollectionEvent extends CollectionsEvent {
  final Collection collection;

  CollectionsDeleteCollectionEvent(this.collection);
}

part of 'collections_bloc.dart';

sealed class CollectionsEvent {}

/// event for first loading the class
final class LoadCollectionsEvent extends CollectionsEvent {}

/// call the event to create a new collection
final class NewCollectionsEvent extends CollectionsEvent {
  final String collectionPath;

  NewCollectionsEvent(this.collectionPath);
}

/// call the event to open a collection
final class OpenCollectionsEvent extends CollectionsEvent {
  final String collectionPath;

  OpenCollectionsEvent(this.collectionPath);
}

/// call the event to delete a collection
final class DeleteCollectionsEvent extends CollectionsEvent {
  final Collection collection;

  DeleteCollectionsEvent(this.collection);
}

part of 'collections_bloc.dart';

sealed class CollectionsEvent {}

/// event for first loading the class
final class LoadCollectionsEvent extends CollectionsEvent {}

final class NewCollectionsEvent extends CollectionsEvent {}

final class OpenCollectionsEvent extends CollectionsEvent {}

final class DeleteCollectionsEvent extends CollectionsEvent {
  final Collection collection;

  DeleteCollectionsEvent(this.collection);
}

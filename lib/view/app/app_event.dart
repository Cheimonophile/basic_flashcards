part of 'app.dart';

sealed class AppEvent {}

/// event for first loading the class
final class AppLoadEvent extends AppEvent {}

final class AppNewCollectionEvent extends AppEvent {}

final class AppOpenCollectionEvent extends AppEvent {}

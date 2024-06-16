part of 'app.dart';

sealed class AppState {
  static AppState loading() => AppLoadingState._();

  static AppState error() => AppErrorState._();

  static AppState withoutDb() => AppLoadedState._(dbUri: null);

  static AppState withDb(String dbUri) => AppLoadedState._(dbUri: dbUri);

  bool get isLoading => this is AppLoadingState;
}

final class AppLoadingState extends AppState {
  AppLoadingState._() : super();
}

final class AppErrorState extends AppState {
  AppErrorState._() : super();
}

final class AppLoadedState extends AppState {
  AppLoadedState._({required this.dbUri}) : super();

  final String? dbUri;
}

part of 'app.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.loading()) {
    on<AppLoadEvent>(_onAppLoadEvent);

    // load the app event
    add(AppLoadEvent());
  }

  /// Event handler for load event
  void _onAppLoadEvent(AppLoadEvent event, Emitter<AppState> emit) async {
    final String? dbUri = await Preferences.dbUri;
    if (dbUri == null) {
      emit(AppState.withoutDb());
    }
    else {
      emit(AppState.withDb(dbUri));
    }
  }
}

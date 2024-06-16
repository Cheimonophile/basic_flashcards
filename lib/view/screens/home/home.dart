import 'package:basic_flashcards/types/widgets/screen.dart';
import 'package:basic_flashcards/view/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends Screen {
  const Home({super.key});

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Home Page"),
        ),
        body: BlocBuilder<AppBloc, AppState>(
            builder: (BuildContext context, AppState state) {
          // If the app is loading, show a loading indicator
          if (state is AppLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // if the app is in an error state, show an error message
          if (state is AppErrorState) {
            return const Center(
              child: Text("An error occurred"),
            );
          }

          // if the app is in loaded state
          if (state is AppLoadedState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'DB URI: ${state.dbUri}',
                  ),
                ],
              ),
            );
          }

          // unreachable state
          return const Center();
        }));
  }
}

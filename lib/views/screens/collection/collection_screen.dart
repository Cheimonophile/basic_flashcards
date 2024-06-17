import 'package:basic_flashcards/types/data/collection.dart';
import 'package:basic_flashcards/types/widgets/screen.dart';
import 'package:flutter/material.dart';

class CollectionScreen extends Screen {
  final Collection collection;

  const CollectionScreen({super.key, required this.collection});

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Collection"),
      ),
      body: const Center(
        child: Text("Collection Screen"),
      ),
    );
  }
}

import 'dart:math';

const maxInt = 1000;

/// Generates a list of random integers
List<int> randInts(int numTestsPerObject) =>
    List<int>.generate(numTestsPerObject, (i) => Random().nextInt(maxInt));

/// Generates a list of random strings
List<String> randStrings(int numTestsPerObject) => List<String>.generate(
    numTestsPerObject, (i) => Random().nextInt(maxInt).toString());

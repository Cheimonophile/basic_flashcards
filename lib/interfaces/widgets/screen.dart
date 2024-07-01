import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Abstract class for all of the screens in the application
abstract class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context);

  /// Generate the route for a screen
  @nonVirtual
  MaterialPageRoute get route {
    return MaterialPageRoute(
      builder: (context) => this,
    );
  }
}

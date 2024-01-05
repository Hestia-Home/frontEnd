import 'package:flutter/material.dart';
import 'package:hestia/core/di/dependencies.dart';
import 'package:provider/provider.dart';

class DependenciesProvider extends StatelessWidget {
  final Dependencies dependencies;
  final Widget child;
  const DependenciesProvider({
    super.key,
    required this.dependencies,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => dependencies,
      child: child,
    );
  }
}

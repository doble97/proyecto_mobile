import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              bottom: MediaQuery.of(context).padding.bottom),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.8),
            Theme.of(context).colorScheme.secondary.withOpacity(0.5),
          ], begin: Alignment.bottomCenter, end: Alignment.bottomCenter)),
          child: child,
        ));
  }
}

import 'package:flutter/material.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation(this.delay, this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    final tween = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    );

    return TweenAnimationBuilder(
      tween: tween,
      duration: const Duration(milliseconds: 500),
      child: child,
      builder: (context, Offset offset, child) {
        return Transform.translate(
          offset: offset,
          child: child,
        );
      },
    );
  }
}
